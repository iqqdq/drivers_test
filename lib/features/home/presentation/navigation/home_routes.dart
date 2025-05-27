import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const _home = '/home';

abstract class HomeRoutes {
  static String get home => _home;

  static final List<GoRoute> routes = [
    GoRoute(
      path: _home,
      builder:
          (context, state) => ChangeNotifierProvider(
            create: (context) => HomeChangeNotifier(),
            child: const HomeScreen(),
          ),
    ),
  ];
}
