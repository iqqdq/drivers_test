import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeChangeNotifier _read;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _read = context.read<HomeChangeNotifier>();
      _read.getExam();
    });
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeChangeNotifier>();
    final state = context.watch<SettingsChangeNotifier>().settings?.state;
    final totalPassedTest =
        context.watch<StatisticsChangeNotifier>().totalPassedTest;
    final totalTest = context.watch<StatisticsChangeNotifier>().totalTest;
    final examReadiness =
        context.watch<StatisticsChangeNotifier>().examReadiness;

    return Scaffold(
      appBar: HomeAppBar(
        title: state?.toStateName() ?? '',
        onStateTap: _onStateTap,
        onNotificationsTap: _onNotificationsTap,
        onSettingsTap: _onSettingsTap,
      ),
      body: ListView(
        padding: EdgeInsets.all(
          16.0,
        ).copyWith(bottom: getBottomPadding(context)),
        children: [
          /// GET PREMIUM
          isSubscribed.value
              ? SizedBox.shrink()
              : Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: GetPremiumCard(
                  totalPassedTest: totalPassedTest,
                  totalTest: totalTest,
                  onTap: _onGetPremiumTap,
                ),
              ),

          /// TEST
          TestsCard(
            passed: totalPassedTest,
            total: totalTest,
            onTap: _onTestsTap,
          ),
          const SizedBox(height: 12.0),

          /// EXAM
          ExamCard(
            questions: watch.examQuestionAmount,
            passing: watch.passingScore,
            correct: watch.correctAnswersToPass,
            minutes: watch.examQuestionAmount,
            onTap: _onExamTap,
          ),
          const SizedBox(height: 12.0),

          /// STATISTIC'S
          StatsCard(percent: examReadiness, onTap: _onStatsTap),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onGetPremiumTap() =>
      router.push(OnboardingRoutes.onboarding, extra: true);

  void _onStateTap() async {
    await router.push(SettingsRoutes.settingsSelection, extra: true);
    await _read.getExam();
  }

  void _onSettingsTap() => router.push(SettingsRoutes.settings);

  void _onNotificationsTap() => router.push(RemindersRoutes.reminders);

  void _onTestsTap() => router.push(TestingRoutes.testCatalog);

  void _onExamTap() async {
    // Обновляем экзамент перед переходом
    await _read.getExam();

    if (mounted) {
      router.push(
        TestingRoutes.testPage,
        extra: TestScreenRouteArgs(
          test: context.read<HomeChangeNotifier>().test!,
        ),
      );
    }
  }

  void _onStatsTap() => router.push(StatisticsRoutes.statistics);
}
