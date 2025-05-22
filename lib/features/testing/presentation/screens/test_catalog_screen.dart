import 'package:drivers_test/app/router.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestCatalogScreen extends StatefulWidget {
  const TestCatalogScreen({super.key});

  @override
  State<TestCatalogScreen> createState() => _TestCatalogScreenState();
}

class _TestCatalogScreenState extends State<TestCatalogScreen> {
  late final TestCatalogChangeNotifier _read;
  late String _state;

  @override
  void initState() {
    _read = context.read<TestCatalogChangeNotifier>();
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _read.getTests(state: _state);
    });
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<TestCatalogChangeNotifier>();
    _state = context.watch<SettingsChangeNotifier>().settings?.state ?? '';

    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          CustomAppBarIconAction(icon: AppIcons.stats, onTap: _onStatisticsTap),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '$_state ${AppTitles.stateTestCatalog}'.toStateName(),
              style: AppTextStyles.headlineTitle1,
            ),
          ),
          const SizedBox(height: 24.0),

          /// TODO SHOW IF NOT SUBSCRIBED
          /// GET PREMIUM
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: GetPremiumCard(
              subtitle: AppTitles.getUnlimitedNumberOfTests,
              secondSubtitle:
                  '${AppTitles.thereAreOnly} null/null ${AppTitles.practicalTestsAvailableNow}', // TODO SHOW COMPLETED/AVAILABLE TEST COUNT
              onTap: _onGetPremiumTap,
            ),
          ),

          const SizedBox(height: 12.0),

          /// TEST LIST VIEW
          watch.tests == null
              ? SizedBox.shrink()
              : Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ).copyWith(top: 12.0, bottom: getBottomPadding(context)),
                  itemCount: watch.tests!.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 12.0),
                  itemBuilder: (context, index) {
                    final test = watch.tests![index];

                    return TestTile(
                      index: test.id,
                      name: test.name,
                      accuracy: test.accuracy,
                      correct: test.correct,
                      total: test.amount,
                      onTap: () => _onTestTap(index),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onGetPremiumTap() {
    // TODO SHOW PAYWALL
  }

  void _onStatisticsTap() => router.push(AppRoutes.statistics);

  void _onTestTap(int index) => router.push(
    TestRoutes.testPage,
    extra: TestScreenRouteArgs(test: _read.tests![index]),
  );
}
