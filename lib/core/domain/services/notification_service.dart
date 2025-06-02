import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz; // Для инициализации

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
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
  List<tz.TZDateTime> _nextInstancesOfDaysAndTime({
    required List<int> daysOfWeek,
    required int hour,
    int minute = 0,
  }) {
    final now = tz.TZDateTime.now(tz.local);
    final List<tz.TZDateTime> scheduledDates = [];

    for (final day in daysOfWeek) {
      // Вычисляем разницу дней до следующего указанного дня недели
      final daysToAdd = (day - now.weekday) % 7;
      // Создаём дату с указанным временем
      final scheduledDate = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day + (daysToAdd == 0 ? 0 : daysToAdd),
        hour,
        minute,
      );
      // Если время уже прошло сегодня, добавляем 7 дней
      if (scheduledDate.isBefore(now)) {
        scheduledDates.add(scheduledDate.add(const Duration(days: 7)));
      } else {
        scheduledDates.add(scheduledDate);
      }
    }

    // Сортируем даты по возрастанию (ближайшие сначала)
    scheduledDates.sort((a, b) => a.compareTo(b));
    return scheduledDates;
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

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Обработка нажатия на уведомление
        debugPrint('Notification tapped: ${response.payload}');
      },
    );

    await _initTimeZone();
  }

  // Проверяем разрешены ли уведомления
  Future<bool> checkNotificationPermission() async {
    final result = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
    return result ?? false;
  }

  // Простое уведомление
  Future showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
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
    final scheduledDates = _nextInstancesOfDaysAndTime(
      daysOfWeek: daysOfWeek,
      hour: hour,
      minute: minute,
    );

    for (final scheduledDate in scheduledDates) {
      final notificationId = id + scheduledDate.weekday;

      await _flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        title,
        body,
        scheduledDate,
        notificationDetails,
        payload: payload,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );

      debugPrint(
        'Scheduling repeating notification with id: $notificationId at $scheduledDate',
      );
    }
  }

  // Отложенное уведомление
  Future scheduleNotification({
    required int id,
    required String title,
    required String body,
    required Duration delay,
    String? payload,
  }) async {
    cancelNotification(id);

    final scheduledDate = tz.TZDateTime.now(tz.local).add(delay);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );

    debugPrint('Scheduling notification with id: $id  at $scheduledDate');
  }

  // Удалить уведомление по ID
  Future cancelNotification(int id) async {
    debugPrint('Notification with id:$id canceled');
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  // Удалить все уведомления
  Future cancelAllNotifications() async {
    debugPrint('All notifications are canceled');
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
