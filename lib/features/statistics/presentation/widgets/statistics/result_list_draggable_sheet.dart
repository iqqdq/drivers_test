import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

class ResultListDraggableSheet extends StatelessWidget {
  final double initialChildSize;
  final List<TestEntity>? tests;
  final TestType? testType;
  final TestResultType? resultType;
  final Function(int index) onFilterTap;
  final Function(int index) onClearFilterTap;
  final Function(int index) onResultTap;

  const ResultListDraggableSheet({
    super.key,
    required this.initialChildSize,
    required this.tests,
    required this.testType,
    required this.resultType,
    required this.onFilterTap,
    required this.onClearFilterTap,
    required this.onResultTap,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: initialChildSize,
      snap: true,
      builder: (context, scrollController) {
        return Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24.0),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            physics:
                tests == null || tests!.isEmpty
                    ? const NeverScrollableScrollPhysics()
                    : const ClampingScrollPhysics(),
            child: Column(
              children: [
                const DragHandle(),

                /// TITLE
                tests == null
                    ? SizedBox.shrink()
                    : Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            AppTitles.practiceHistory,
                            style: AppTextStyles.headlineTitle2,
                          ),
                        ],
                      ),
                    ),

                /// FILTER LIST VIEW
                tests == null
                    ? SizedBox.shrink()
                    : SizedBox(
                      height: 40.0,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: 2,
                        separatorBuilder:
                            (context, index) => const SizedBox(width: 12.0),
                        itemBuilder: (context, index) {
                          final isSelected =
                              index == 0
                                  ? testType != null
                                  : resultType != null;
                          final title =
                              index == 0
                                  ? testType == null
                                      ? AppTitles.typeOfTest
                                      : testType == TestType.exam
                                      ? AppTitles.exam
                                      : AppTitles.practicalTest
                                  : resultType == null
                                  ? AppTitles.testResult
                                  : resultType == TestResultType.passed
                                  ? AppTitles.passed
                                  : AppTitles.failed;

                          return HorizontalFilterTile(
                            title: title,
                            isSelected: isSelected,
                            onTap: () => onFilterTap(index),
                            onClearTap: () => onClearFilterTap(index),
                          );
                        },
                      ),
                    ),

                SizedBox(
                  height:
                      tests == null
                          ? MediaQuery.of(context).size.height * 0.15
                          : tests!.isEmpty
                          ? MediaQuery.of(context).size.height * 0.08
                          : 12.0,
                ),

                /// EMPTY VIEW
                tests == null || tests!.isEmpty
                    ? EmptyListView(
                      icon: tests == null ? AppIcons.info : AppIcons.folder,
                      title:
                          tests == null
                              ? AppTitles.theHistoryOfPracticalTests
                              : AppTitles.thereAreNoTests,
                    )
                    /// TEST LIST VIEW
                    : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ).copyWith(bottom: getBottomPadding(context)),
                      itemCount: tests!.length,
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 12.0),
                      itemBuilder: (context, index) {
                        final test = tests![index];
                        final next = index + 1;
                        final nextIndex = next < tests!.length ? next : index;
                        final isDateHidden =
                            index == 0
                                ? false
                                : isSameDate(
                                  test.result!.completedAt,
                                  tests![nextIndex].result!.completedAt,
                                );

                        return ResultTile(
                          test: test,
                          isDateHidden: isDateHidden,
                          onTap: () => onResultTap(index),
                        );
                      },
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
