import 'package:drivers_test/app/app.dart';
import 'package:drivers_test/features/home/home.dart';
import 'package:drivers_test/features/settings/settings.dart';
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
    final state = context.watch<SettingsChangeNotifier>().settings?.state;

    return Scaffold(
      appBar: HomeAppBar(
        title: state,
        onStateTap: _onStateTap,
        onNotificationsTap: _onNotificationsTap,
        onSettingsTap: _onSettingTap,
      ),
      body: ListView(
        padding: EdgeInsets.all(
          16.0,
        ).copyWith(bottom: MediaQuery.of(context).padding.bottom),
        children: [
          PracticalTestsCard(
            passed: 0,
            total: 0,
            onTap: _onPracticalTestsCardTap,
          ),
          const SizedBox(height: 12.0),
          ExamCard(
            questions: 0,
            passing: 0,
            correct: 0,
            minutes: 0,
            onTap: _onExamCardTap,
          ),
          const SizedBox(height: 12.0),
          StatsCard(percent: 0, onTap: _onStatsCardTap),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onStateTap() => Navigator.pushNamed(context, AppRoutes.settingsState);

  void _onSettingTap() => Navigator.pushNamed(context, AppRoutes.settings);

  void _onNotificationsTap() {}
  // => Navigator.pushNamed(context, AppRoutes.settings);

  void _onPracticalTestsCardTap() =>
      Navigator.pushNamed(context, AppRoutes.practice);

  void _onExamCardTap() {}

  void _onStatsCardTap() {}
}
