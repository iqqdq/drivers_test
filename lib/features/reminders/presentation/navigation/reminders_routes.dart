import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const _reminders = '/reminders';
const _reminderPage = '/reminder_page';

abstract class RemindersRoutes {
  static String get reminders => _reminders;
  static String get reminderPage => _reminderPage;

  static final List<GoRoute> routes = [
    GoRoute(
      path: _reminders,
      builder: (context, state) => const RemindersScreen(),
    ),
    GoRoute(
      path: _reminderPage,
      builder:
          (context, state) =>
              ChangeNotifierProvider<ReminderPageChangeNotifier>(
                create: (_) => ReminderPageChangeNotifier(),
                child: const ReminderPageScreen(),
              ),
    ),
  ];
}
