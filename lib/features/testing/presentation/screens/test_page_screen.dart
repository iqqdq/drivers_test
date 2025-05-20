import 'package:drivers_test/app/app.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPageScreen extends StatefulWidget {
  const TestPageScreen({super.key});

  @override
  State<TestPageScreen> createState() => _TestPageScreenState();
}

class _TestPageScreenState extends State<TestPageScreen> {
  final PageController _pageController = PageController();
  late final TestPageChangeNotifier _read;

  @override
  void initState() {
    _read = context.read<TestPageChangeNotifier>();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<TestPageChangeNotifier>();

    return Scaffold(
      appBar: CustomAppBar(
        title: watch.test.name,
        leading: CustomCloseButton(onTap: () => router.pop()),
        actions:
            watch.questions == null
                ? null
                : [TimerAppBarAction(duration: watch.duration)],
      ),
      body:
          watch.questions == null
              /// LOADING INDICATOR
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingIndicator(color: AppColors.black100),
                  const SizedBox(height: 40.0),
                  Text(
                    AppTitles.pleaseWaitForTestToLoad,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headlineTitle2,
                  ),
                ],
              )
              : Column(
                children: [
                  const SizedBox(height: 8.0),

                  /// NUMBER LIST VIEW
                  SizedBox(
                    height: 46.0,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: watch.test.amount,
                      separatorBuilder:
                          (context, index) => SizedBox(width: 4.0),
                      itemBuilder: (context, index) {
                        final question = watch.questions![index];

                        return NumberTile(
                          number: '${index + 1}',
                          isSelected: index == watch.index,
                          isCorrect:
                              question.answer == null
                                  ? null
                                  : question.answer == question.correct,
                          onTap: () => _onNumberTap(index),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  /// QUESTION'S PAGE VIEW
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) => _read.selectQuestion(index),
                      itemBuilder: (context, index) {
                        final question = watch.questions![index];

                        return QuestionView(
                          question: question,
                          ingoreGesture: watch.isTestCompleted,
                          onTap:
                              (index) => _read.setQuestion(
                                question.copyWith(answer: index),
                              ),
                        );
                      },
                    ),
                  ),

                  watch.isTimeUp || watch.isTestCompleted
                      ? SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: PrimaryButton(
                            title: AppTitles.complete,
                            onTap: _onCompleteTap,
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onNumberTap(int index) async {
    await _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _read.selectQuestion(index);
  }

  void _onCompleteTap() async {
    await _read.saveTest();
    router.replace('test_result');
  }
}
