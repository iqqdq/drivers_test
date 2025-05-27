import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';

const _settings = '/settings';
const _settingsSelection = '/settings_selection';

abstract class SettingsRoutes {
  static String get settings => _settings;
  static String get settingsSelection => _settingsSelection;

  static final List<GoRoute> routes = [
    GoRoute(
      path: _settings,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: _settingsSelection,
      builder: (context, state) {
        final args = state.extra as bool;
        return SettingSelectionScreen(isStateSelection: args);
      },
    ),
  ];
}
