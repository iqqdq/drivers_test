import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';

const _reminders = '/reminders';
const _reminderSettings = '/reminder_settings';

abstract class RemindersRoutes {
  static String get reminders => _reminders;
  static String get reminderSettings => _reminderSettings;

  static final List<GoRoute> routes = [
    GoRoute(path: _reminders, builder: (context, state) => RemindersScreen()),
    GoRoute(
      path: _reminderSettings,
      builder: (context, state) => ReminderSettingsScreen(),
    ),
  ];
}
