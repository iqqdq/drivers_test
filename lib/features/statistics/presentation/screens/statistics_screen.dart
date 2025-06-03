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
    final progressHeight = isSubscribed.value ? 260.0 : 386.0;
    final sheetCoefficient =
        1.0 - progressHeight / MediaQuery.of(context).size.height;
    final watch = context.watch<StatisticsChangeNotifier>();

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
                ).copyWith(top: 12.0),
                height: progressHeight,
                child: Column(
                  children: [
                    /// GET PREMIUM
                    isSubscribed.value
                        ? SizedBox.shrink()
                        : Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: GetPremiumCard(
                            totalPassedTest: watch.totalPassedTest,
                            totalTest: watch.totalTest,
                            onTap: _onGetPremiumTap,
                          ),
                        ),

                    /// PROGRESS INDICATOR LIST VIEW
                    ProgressIndicatorListView(
                      examReadiness: watch.examReadiness,
                      totalPassedTest: watch.totalPassedTest,
                      totalTest: watch.totalTest,
                      totalCorrectAnswers: watch.totalCorrectAnswers,
                      totalQuestions: watch.totalQuestions,
                    ),
                  ],
                ),
              ),

              /// RESULT LIST DRAGGABLE SHEET
              ResultListDraggableSheet(
                initialChildSize: sheetCoefficient,
                tests: watch.tests,
                testType: watch.testType,
                resultType: watch.resultType,
                onFilterTap: _onFilterTap,
                onClearFilterTap: _onClearFilterTap,
                onResultTap: _onResultTap,
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
      router.push(PaywallRoutes.paywall, extra: PaywallType.week);

  void _onTipTap() => router.push(StatisticsRoutes.tips);

  void _onFilterTap(int index) {
    final title = index == 0 ? AppTitles.typeOfTest : AppTitles.testResult;
    final actions =
        index == 0
            ? [AppTitles.exam, AppTitles.practicalTest]
            : [AppTitles.passed, AppTitles.failed];
    final action =
        index == 0
            ? _read.testType == null
                ? null
                : _read.testType == TestType.exam
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

  void _onResultTap(int index) async =>
      router.push(TestingRoutes.testResult, extra: _read.tests![index]);
}
