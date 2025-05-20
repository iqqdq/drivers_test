import 'package:drivers_test/app/router.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/cupertino.dart';
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
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        leading: CustomBackButton(color: color, onTap: () => router.pop()),
        title: AppTitles.statistics,
        titleColor: color,
        actions: [
          GestureDetector(
            onTap: _onTipTap,
            child: SvgPicture.asset(AppIcons.tips),
          ),
        ],
      ),
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
                    onTap: _onGetPremiumTap,
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
              return SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
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
                                return HorizontalFilterTile(
                                  title:
                                      index == 0
                                          ? AppTitles.typeOfTest
                                          : index == 1
                                          ? AppTitles.testResult
                                          : AppTitles.category,
                                  isSelected: index == 0, // TODO REPLACE
                                  onTap: () => _onFilterTap(index),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 16.0),

                          /// TEST LIST VIEW
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(
                              bottom: getBottomPadding(context),
                            ),

                            itemCount: 20,
                            itemBuilder:
                                (context, index) =>
                                    ListTile(title: Text("Элемент $index")),
                          ),
                        ],
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

  void _onGetPremiumTap() {
    // TODO SHOW PAYWALL
  }

  void _onTipTap() => router.push(AppRoutes.tips);

  void _onFilterTap(int index) => showModalBottomSheet(
    context: context,
    builder:
        (context) => Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ).copyWith(bottom: getBottomPadding(context)),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DragHandle(),
              const SizedBox(height: 16),

              /// TITLE
              Text('null', style: AppTextStyles.headlineTitle2),
              const SizedBox(height: 24),
              // ACTIONS
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 2,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 12.0),
                itemBuilder: (context, index) {
                  return FilterTile(
                    title: 'null',
                    isSelected: index == 1,
                    onTap: () {
                      // TODO
                    },
                  );
                },
              ),
              const SizedBox(height: 24),

              /// APPLY BUTTON
              PrimaryButton(
                title: AppTitles.apply,
                // onTap: () {},  TODO IF SELECTED
              ),
            ],
          ),
        ),
  );
}
