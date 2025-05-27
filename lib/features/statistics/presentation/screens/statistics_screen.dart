import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  late final StatisticsChangeNotifier _read;

  @override
  void initState() {
    _read = context.read<StatisticsChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<StatisticsChangeNotifier>();

    final totalCoefficient = 1.0;
    final screenHeightCoefficient =
        MediaQuery.of(context).size.height / totalCoefficient;
    final progressHeight = isSubscribed.value ? 330.0 : 460.0;
    final sheetCoefficient = progressHeight / screenHeightCoefficient;
    final initialChildSize = totalCoefficient - sheetCoefficient;

    return Stack(
      children: [
        /// BACKGROUND IMAGE
        Image.asset(AppImages.statisticsBg, fit: BoxFit.cover),

        /// SCREEN CONTENT
        Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            backgroundColor: Colors.transparent,
            leading: CustomBackButton(
              color: AppColors.white,
              onTap: () => router.pop(),
            ),
            title: AppTitles.statistics,
            titleColor: AppColors.white,
            actions: [
              GestureDetector(
                onTap: _onTipTap,
                child: SvgPicture.asset(AppIcons.tips),
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ).copyWith(top: 16.0),
                height: progressHeight,
                child: Column(
                  children: [
                    /// GET PREMIUM
                    isSubscribed.value
                        ? SizedBox.shrink()
                        : Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: GetPremiumCard(
                            subtitle: AppTitles.getUnlimitedNumberOfTests,
                            secondSubtitle:
                                '${AppTitles.thereAreOnly} null/null ${AppTitles.practicalTestsAvailableNow}', // TODO SHOW COMPLETED/AVAILABLE TEST COUNT
                            onTap: _onGetPremiumTap,
                          ),
                        ),

                    /// PROGRESS INDICATOR LIST VIEW
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      padding: EdgeInsets.zero,
                      separatorBuilder:
                          (context, index) => SizedBox(height: 12.0),
                      itemBuilder: (context, index) {
                        final progress = _read.progressValue(index);
                        final title =
                            index == 0
                                ? AppTitles.examReadiness
                                : index == 1
                                ? AppTitles.passedPracticalTests
                                : AppTitles.correctAnswers;
                        final color =
                            index == 0
                                ? AppColors.yellow
                                : index == 2
                                ? AppColors.blue100
                                : null;
                        final value =
                            index == 0
                                ? '${watch.examReadiness}%'
                                : index == 1
                                ? '${watch.totalPassedTest}/${watch.totalTest}'
                                : '${watch.totalCorrectAnswers}/${watch.totalQuestions}';

                        return CustomProgressIndicator(
                          duration: Duration(milliseconds: 500 * index),
                          progress: progress,
                          title: title,
                          value: value,
                          color: color,
                        );
                      },
                    ),
                  ],
                ),
              ),

              /// DRAGGABLE SHEET
              DraggableScrollableSheet(
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
                          watch.tests == null || watch.tests!.isEmpty
                              ? const NeverScrollableScrollPhysics()
                              : const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          const DragHandle(),

                          /// TITLE
                          watch.tests == null
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
                          watch.tests == null
                              ? SizedBox.shrink()
                              : SizedBox(
                                height: 40.0,
                                child: ListView.separated(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: 2,
                                  separatorBuilder:
                                      (context, index) => SizedBox(width: 12.0),
                                  itemBuilder: (context, index) {
                                    final isSelected =
                                        index == 0
                                            ? watch.type != null
                                            : watch.resultType != null;
                                    return HorizontalFilterTile(
                                      title: _read.filterValue(index),
                                      isSelected: isSelected,
                                      onTap: () => _onFilterTap(index),
                                      onClearTap:
                                          () => _onClearFilterTap(index),
                                    );
                                  },
                                ),
                              ),

                          const SizedBox(height: 12.0),

                          /// EMPTY VIEW
                          watch.tests == null || watch.tests!.isEmpty
                              ? EmptyListView(
                                icon:
                                    watch.tests == null
                                        ? AppIcons.info
                                        : AppIcons.folder,
                                title:
                                    watch.tests == null
                                        ? AppTitles.theHistoryOfPracticalTests
                                        : AppTitles.thereAreNoTests,
                              )
                              :
                              /// TEST LIST VIEW
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ).copyWith(bottom: getBottomPadding(context)),
                                itemCount: watch.tests!.length,
                                separatorBuilder:
                                    (context, index) =>
                                        const SizedBox(height: 12.0),
                                itemBuilder: (context, index) {
                                  final test = watch.tests![index];
                                  final next = index + 1;
                                  final nextIndex =
                                      next < watch.tests!.length ? next : index;
                                  final isDateHidden =
                                      index == 0
                                          ? false
                                          : isSameDate(
                                            test.result!.completedAt,
                                            watch
                                                .tests![nextIndex]
                                                .result!
                                                .completedAt,
                                          );

                                  return ResultTile(
                                    test: test,
                                    isDateHidden: isDateHidden,
                                    onTap: () => _onResultTap(index),
                                  );
                                },
                              ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onGetPremiumTap() =>
      router.push(OnboardingRoutes.onboarding, extra: true);

  void _onTipTap() => router.push(StatisticsRoutes.tips);

  void _onFilterTap(int index) {
    final title = index == 0 ? AppTitles.typeOfTest : AppTitles.testResult;
    final actions =
        index == 0
            ? [AppTitles.exam, AppTitles.practicalTest]
            : [AppTitles.passed, AppTitles.failed];
    var action =
        index == 0
            ? _read.type == null
                ? null
                : _read.type == TestType.exam
                ? 0
                : 1
            : _read.resultType == null
            ? null
            : _read.resultType == TestResultType.passed
            ? 0
            : 1;

    showModalBottomSheet(
      context: context,
      builder:
          (context) => FilterView(
            title: title,
            actions: actions,
            action: action,
            onTap: (action) {
              router.pop();
              index == 0
                  ? _read.toogleTestType(
                    action == 0 ? TestType.exam : TestType.test,
                  )
                  : _read.toogleTestResultType(
                    action == 0 ? TestResultType.passed : TestResultType.failed,
                  );
            },
          ),
    );
  }

  void _onClearFilterTap(int index) =>
      index == 0
          ? _read.toogleTestType(null)
          : _read.toogleTestResultType(null);

  void _onResultTap(int index) async => router.push(
    TestingRoutes.testPage,
    extra: TestScreenRouteArgs(
      test: _read.tests![index],
      answers: _read.tests![index].result!.answers,
    ),
  );
}
