import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

abstract class StatisticsRoutes {
  static const _statistics = '/statistics';
  static const _tips = '/tips';

  static String get statistics => _statistics;
  static String get tips => _tips;

  static final List<GoRoute> routes = [
    GoRoute(
      path: _statistics,
      builder:
          (context, state) => ChangeNotifierProvider<StatisticsChangeNotifier>(
            create: (_) => StatisticsChangeNotifier()..getStatistics(),
            child: const StatisticsScreen(),
          ),
    ),
    GoRoute(path: _tips, builder: (context, state) => const TipsScreen()),
  ];
}
