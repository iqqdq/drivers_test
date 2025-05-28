import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz; // Для инициализации

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final NotificationDetails notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'schedule_channel_id',
      'Scheduled Notifications',
      importance: Importance.max,
      priority: Priority.high,
    ),
    iOS: DarwinNotificationDetails(),
  );

  // Инициализация часового пояса
  Future _initTimeZone() async {
    try {
      final timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation(timeZoneName));
    } catch (e) {
      debugPrint('Ошибка установки часового пояса: $e');
      tz.setLocalLocation(tz.getLocation('UTC')); // Запасной вариант
    }
  }

  // Инициализация отложенных даты и времени
  tz.TZDateTime _nextInstanceOfDaysAndTime({
    required List<int> daysOfWeek,
    required int hour,
    int minute = 0,
  }) {
    final now = tz.TZDateTime.now(tz.local);

    // Сортируем дни недели по порядку (от ближайшего)
    daysOfWeek.sort((a, b) {
      final aDiff = (a - now.weekday) % 7;
      final bDiff = (b - now.weekday) % 7;
      return aDiff.compareTo(bDiff);
    });

    // Проверяем каждый день на возможность использования сегодня
    for (final day in daysOfWeek) {
      final scheduledDate = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        hour,
        minute,
      ).add(Duration(days: (day - now.weekday) % 7));

      // Если время ещё не наступило сегодня/в этот день
      if (scheduledDate.isAfter(now)) {
        return scheduledDate;
      }
    }

    // Если все варианты прошли, берём первый день следующей недели
    return tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    ).add(Duration(days: (daysOfWeek.first - now.weekday) % 7 + 7));
  }

  Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Обработка нажатия на уведомление
        debugPrint('Notification tapped: ${response.payload}');
      },
    );

    await _initTimeZone();
  }

  Future requestNotificationPermission() async {
    final permission = Permission.notification;
    if (await permission.isDenied) {
      await permission.request();
    }
  }

  Future<bool> checkNotificationPermission() async =>
      await Permission.notification.status.isGranted;

  // Простое уведомление
  Future showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    await _notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  // Отложенное уведомление с повтором в указанные дни
  Future scheduleRepeatingNotification({
    required int id,
    required String title,
    required String body,
    required List<int> daysOfWeek,
    required int hour,
    required int minute,
    String? payload,
  }) async {
    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      _nextInstanceOfDaysAndTime(
        daysOfWeek: daysOfWeek,
        hour: hour,
        minute: minute,
      ),
      notificationDetails,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  // Отложенное уведомление
  Future scheduleNotification({
    required int id,
    required String title,
    required String body,
    required Duration delay,
    String? payload,
  }) async {
    final scheduledDate = tz.TZDateTime.now(tz.local).add(delay);
    debugPrint('Scheduling notification at $scheduledDate');

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  // Удалить уведомление по ID
  Future cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  // Удалить все уведомления
  Future cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }
}
