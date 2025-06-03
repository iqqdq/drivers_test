import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:drivers_test/core/core.dart';

abstract class TestingRoutes {
  static const _home = '/home';
  static const _testCatalog = 'test_catalog';
  static const _testPage = '/test_page/:test';
  static const _testResult = '/test_result/:test';

  static String get home => _home;
  static String get testCatalog => '$home/$_testCatalog';
  static String get testPage => _testPage;
  static String get testResult => _testResult;

  static final List<GoRoute> routes = [
    GoRoute(
      path: _home,
      builder:
          (context, state) => ChangeNotifierProvider(
            create: (context) => HomeChangeNotifier(),
            child: const HomeScreen(),
          ),
      routes: [
        GoRoute(
          path: _testCatalog,
          builder:
              (context, state) =>
                  ChangeNotifierProvider<TestCatalogChangeNotifier>(
                    create: (_) => TestCatalogChangeNotifier(),
                    child: const TestCatalogScreen(),
                  ),
        ),
      ],
    ),
    GoRoute(
      path: _testPage,
      builder: (context, state) {
        final args = state.extra as TestScreenRouteArgs;
        return ChangeNotifierProvider<TestChangeNotifier>(
          create:
              (_) =>
                  TestChangeNotifier(test: args.test, answers: args.answers)
                    ..getQuestions(),
          child: const TestScreen(),
        );
      },
    ),
    GoRoute(
      path: _testResult,
      builder: (context, state) {
        final args = state.extra as TestEntity;
        return ChangeNotifierProvider<TestResultChangeNotifier>(
          create: (_) => TestResultChangeNotifier(test: args)..getResult(),
          child: const TestResultScreen(),
        );
      },
    ),
  ];
}
