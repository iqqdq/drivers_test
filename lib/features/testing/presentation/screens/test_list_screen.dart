import 'package:drivers_test/app/routes.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/presentation/presentation.dart';
import 'package:drivers_test/features/settings/settings.dart';
import 'package:drivers_test/features/testing/presentation/providers/test_list_change_notifier.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestListScreen extends StatefulWidget {
  const TestListScreen({super.key});

  @override
  State<TestListScreen> createState() => _TestListScreenState();
}

class _TestListScreenState extends State<TestListScreen> {
  late final TestListChangeNotifier read;

  @override
  void initState() {
    read = context.read<TestListChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsChangeNotifier>().settings?.state;
    final watch = context.watch<TestListChangeNotifier>();

    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          CustomAppBarAction(icon: AppIcons.stats, onTap: _onStatisticsTap),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '$state ${AppTitles.stateTestCatalog}',
              style: AppTextStyles.headlineTitle1,
            ),
          ),
          const SizedBox(height: 24.0),

          /// TODO SHOW IF NOT SUBSCRIBED
          /// GET PREMIUM
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ).copyWith(bottom: 24.0),
            child: GetPremiumCard(
              subtitle: AppTitles.getUnlimitedNumberOfTests,
              secondSubtitle:
                  '${AppTitles.thereAreOnly} null/null ${AppTitles.practicalTestsAvailableNow}', // TODO SHOW COMPLETED/AVAILABLE TEST COUNT
              onTap: _onGetPremiumPressed,
            ),
          ),

          /// TEST CATEGORY LIST VIEW
          SizedBox(
            height: 40.0,
            child:
                watch.categories == null
                    ? SizedBox.shrink()
                    : ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: watch.categories!.length,
                      separatorBuilder:
                          (context, index) => SizedBox(width: 8.0),
                      itemBuilder: (context, index) {
                        return TestCategoryTile(
                          title: watch.categories![index],
                          isSelected:
                              watch.category == watch.categories![index],
                          onTap: () => _onTestCategoryTap(index),
                        );
                      },
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
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  itemCount: watch.tests!.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.0),
                  itemBuilder: (context, index) {
                    final test = watch.tests![index];
                    final correct =
                        test.questions
                            .where((q) => q.answer == q.correct)
                            .length;
                    final accuracy =
                        correct == 0
                            ? null
                            : (test.questions.length ~/ correct) * 100;

                    return TestTile(
                      index: index,
                      name: test.name,
                      category: test.category,
                      accuracy: accuracy,
                      correct: correct,
                      total: test.questions.length,
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

  void _onGetPremiumPressed() {
    // TODO SHOW PAYWALL
  }

  void _onStatisticsTap() => Navigator.pushNamed(context, AppRoutes.statistics);

  void _onTestCategoryTap(int index) =>
      read.getTests(category: index == 0 ? null : read.categories?[index]);

  void _onTestTap(int index) {
    // TODO SET SELECTED TEST
    Navigator.pushNamed(context, AppRoutes.testPage);
  }
}
