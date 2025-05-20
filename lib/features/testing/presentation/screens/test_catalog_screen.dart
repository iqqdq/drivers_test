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
  late final TestListChangeNotifier _read;
  late String _state;

  @override
  void initState() {
    _read = context.read<TestListChangeNotifier>();
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _read.getTests(state: _state);
    });
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<TestListChangeNotifier>();
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
              '$_state ${AppTitles.stateTestCatalog}'.toState(),
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
                  padding: EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                    top: 12.0,
                    bottom: getBottomPadding(context) + 16.0,
                  ),
                  itemCount: watch.tests!.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.0),
                  itemBuilder: (context, index) {
                    final test = watch.tests![index];
                    final correct = test.result ?? 0;
                    final accuracy =
                        correct == 0 ? null : (correct ~/ correct) * 100;

                    return TestTile(
                      index: index,
                      name: test.name,
                      accuracy: accuracy,
                      correct: correct,
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

  void _onTestTap(int index) =>
      router.push(AppRoutes.testPage, extra: _read.tests![index]);
}
