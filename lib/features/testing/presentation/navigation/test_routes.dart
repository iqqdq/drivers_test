import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const _testCatalog = '/test_catalog';
const _testPage = '/test_page/:test';
const _testResult = '/test_result';

abstract class TestRoutes {
  static String get testCatalog => _testCatalog;
  static String get testPage => _testPage;
  static String get testResult => _testResult;

  static final List<GoRoute> routes = [
    GoRoute(
      path: _testCatalog,
      builder: (context, state) => const TestCatalogScreen(),
    ),
    GoRoute(
      path: _testPage,
      builder: (context, state) {
        final args = state.extra as TestScreenRouteArgs;
        return ChangeNotifierProvider(
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
        return ChangeNotifierProvider(
          create: (_) => TestResultChangeNotifier(test: args)..getResult(),
          child: const TestResultScreen(),
        );
      },
    ),
  ];
}
