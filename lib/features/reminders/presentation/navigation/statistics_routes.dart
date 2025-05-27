import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const _statistics = '/statistics';
const _tips = '/tips';

abstract class StatisticsRoutes {
  static String get statistics => _statistics;
  static String get tips => _tips;

  static final List<GoRoute> routes = [
    GoRoute(
      path: _statistics,
      builder:
          (context, state) => ChangeNotifierProvider(
            create: (_) => StatisticsChangeNotifier()..getStatistics(),
            child: const StatisticsScreen(),
          ),
    ),
    GoRoute(path: _tips, builder: (context, state) => const TipsScreen()),
  ];
}
