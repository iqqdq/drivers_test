import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = [
      AppTitles.takePracticeTests,
      AppTitles.practiceRegularly,
      AppTitles.readThroughYourStatesHandbook,
      AppTitles.startStudyingEarly,
      AppTitles.getYourselfInTheZone,
      AppTitles.getGoodNightsSleep,
    ];
    final descriptions = [
      AppTitles.youCanFindWrittenDrivingTest,
      AppTitles.consistentStudySessions,
      AppTitles.getTheLatestCopyOfYourStates,
      AppTitles.crammingCanMakeItHarder,
      AppTitles.beforeHeadingIntoYourWrittenTest,
      AppTitles.pullingAnAllNighter,
    ];

    return Scaffold(
      appBar: CustomAppBar(title: AppTitles.tipsForPractice),
      body: ListView.separated(
        padding: EdgeInsets.all(
          16.0,
        ).copyWith(bottom: getBottomPadding(context)),
        itemCount: titles.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24.0),
        itemBuilder: (context, index) {
          return TipTile(
            title: titles[index],
            description: descriptions[index],
          );
        },
      ),
    );
  }
}
