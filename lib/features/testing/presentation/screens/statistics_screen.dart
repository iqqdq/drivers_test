import 'package:drivers_test/app/routes.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    final color = AppColors.white;

    final totalCoefficient = 1.0;
    final screenHeightCoefficient =
        MediaQuery.of(context).size.height / totalCoefficient;
    final progressHeight = 516.0; // TODO IF SUBSCRIBED 416.0;
    final sheetCoefficient = progressHeight / screenHeightCoefficient;
    final sheetTopPaddingCoefficient =
        MediaQuery.of(context).padding.top / MediaQuery.of(context).size.height;
    final initialChildSize = totalCoefficient - sheetCoefficient;

    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        leading: CustomBackButton(
          color: color,
          onTap: () => Navigator.pop(context),
        ),
        title: AppTitles.statistics,
        titleColor: color,
        actions: [
          GestureDetector(
            onTap: _onTipPressed,
            child: SvgPicture.asset(AppIcons.tips),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /// BACKGROUND IMAGE
          Image.asset(AppImages.statisticsBg, fit: BoxFit.cover),

          /// HEADER
          Container(
            height: progressHeight,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// TODO SHOW IF NOT SUBSCRIBED
                /// GET PREMIUM
                Padding(
                  // TODO IF SUBSCRIBED padding: EdgeInsets.only(top: 112.0, bottom: 12.0),
                  padding: EdgeInsets.only(top: 90.0, bottom: 12.0),
                  child: GetPremiumCard(
                    subtitle: AppTitles.getUnlimitedNumberOfTests,
                    secondSubtitle:
                        '${AppTitles.thereAreOnly} null/null ${AppTitles.practicalTestsAvailableNow}', // TODO SHOW COMPLETED/AVAILABLE TEST COUNT
                    onTap: _onGetPremiumPressed,
                  ),
                ),

                /// PROGRESS INDICATOR LIST VIEW
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => SizedBox(height: 12.0),
                  itemBuilder: (context, index) {
                    final color =
                        index == 1
                            ? AppColors.yellow
                            : index == 2
                            ? AppColors.blue100
                            : null;

                    return CustomProgressIndicator(
                      progress: 1.0, // TODO CHANGE
                      title:
                          index == 0
                              ? AppTitles.examReadiness
                              : index == 1
                              ? AppTitles.passedPracticalTests
                              : AppTitles.correctAnswers,
                      value:
                          index == 0
                              ? '0%'
                              : index == 1
                              ? 'null/null'
                              : 'null/null',
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
            maxChildSize: totalCoefficient - sheetTopPaddingCoefficient,
            snap: true,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  children: [
                    DragHandle(),
                    // Expanded(
                    //   child: EmptyListView(
                    //     icon: AppIcons.info,
                    //     title: AppTitles.theHistoryOfPracticalTests,
                    //   ),
                    // ),
                    // TODO SHOW WHEN PRACTIAL TESTS COMPLETE

                    /// TITLE
                    Padding(
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
                    SizedBox(
                      height: 40.0,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: 3,
                        separatorBuilder:
                            (context, index) => SizedBox(width: 12.0),
                        itemBuilder: (context, index) {
                          return FilterTile(
                            title:
                                index == 0
                                    ? AppTitles.typeOfTest
                                    : index == 1
                                    ? AppTitles.testResult
                                    : AppTitles.category,
                            isSelected: index == 0, // TODO REPLACE
                            onTap: () {
                              // TODO SHOW FILTER
                            },
                          );
                        },
                      ),
                    ),

                    /// TEST LIST VIEW
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        controller: scrollController,
                        itemCount: 20,
                        itemBuilder:
                            (context, index) =>
                                ListTile(title: Text("Элемент $index")),
                      ),
                    ),
                  ],
                ),
              );
            },
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

  void _onTipPressed() => Navigator.pushNamed(context, AppRoutes.tips);
}
