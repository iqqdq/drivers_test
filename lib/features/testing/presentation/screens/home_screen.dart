import 'package:drivers_test/app/app.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO CREATE TestChangeNotifier VARIABLE OR CRAETE GLOBAL NOTIFIER?
    final state =
        context.watch<SettingsChangeNotifier>().settings?.state?.toState();

    return Scaffold(
      appBar: HomeAppBar(
        title: state,
        onStateTap: _onStateTap,
        onNotificationsTap: _onNotificationsTap,
        onSettingsTap: _onSettingsTap,
      ),
      body: ListView(
        padding: EdgeInsets.all(
          16.0,
        ).copyWith(bottom: getBottomPadding(context) + 16.0),
        children: [
          /// TODO SHOW IF NOT SUBSCRIBED
          /// GET PREMIUM
          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: GetPremiumCard(
              subtitle: AppTitles.getUnlimitedNumberOfTests,
              secondSubtitle:
                  '${AppTitles.thereAreOnly} null/null ${AppTitles.practicalTestsAvailableNow}', // TODO SHOW COMPLETED/AVAILABLE TEST COUNT
              onTap: _onGetPremiumTap,
            ),
          ),

          /// TEST
          TestsCard(
            passed: 0, // TODO SHOW COMPLETED TEST COUNT
            total: 0, // TODO SHOW AVAILABLE TEST COUNT
            onTap: _onTestsTap,
          ),
          const SizedBox(height: 12.0),

          /// EXAM
          ExamCard(
            questions: 0,
            passing: 0,
            correct: 0,
            minutes: 0,
            onTap: () {}, //_onExamTap,
          ),
          const SizedBox(height: 12.0),

          /// STATISTIC'S
          StatsCard(percent: 0, onTap: _onStatsTap),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onGetPremiumTap() {
    // TODO SHOW PAYWALL
  }

  void _onStateTap() => router.push(AppRoutes.settingsSelection);

  void _onSettingsTap() => router.push(AppRoutes.settings);

  void _onNotificationsTap() => router.push(AppRoutes.reminders);

  void _onTestsTap() => router.push(AppRoutes.testCatalog);

  // void _onExamTap() {
  //   // TODO CHECK IF SUBSCRIBED
  //   router.push('AppRoutes.testPage);
  // }

  void _onStatsTap() {}
}
