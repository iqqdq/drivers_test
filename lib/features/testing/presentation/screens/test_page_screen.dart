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
  late final TestPageChangeNotifier read;

  @override
  void initState() {
    read = context.read<TestPageChangeNotifier>();
    super.initState();

    // TODO DELETE
    read.setTest(
      TestEntity(
        category: 'null',
        name: 'null',
        questions: [
          QuestionEntity(
            question: 'Question 1',
            answers: ['1', '2', '3'],
            correct: 0,
          ),
          QuestionEntity(
            question: 'Question 2',
            answers: ['1', '2', '3'],
            correct: 1,
          ),
          QuestionEntity(
            question: 'Question 3',
            answers: ['1', '2', '3'],
            correct: 2,
          ),
          QuestionEntity(
            question: 'Question 4',
            answers: ['1', '2', '3'],
            correct: 3,
          ),
        ],
      ),
    );
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
        title: watch.test?.name,
        leading: CustomCloseButton(onTap: () => Navigator.pop(context)),
        actions:
            watch.test == null
                ? null
                : [TimerAppBarAction(duration: watch.duration)],
      ),
      body:
          watch.test == null
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
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: watch.test?.questions.length,
                      itemBuilder: (context, index) {
                        final question = watch.test!.questions[index];

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
                      onPageChanged: (index) => read.selectQuestion(index),
                      itemBuilder: (context, index) {
                        final question = watch.test!.questions[index];

                        return QuestionView(
                          question: question,
                          ingoreGesture: watch.isTestCompleted,
                          onTap:
                              (index) => read.setQuestion(
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

  void _onNumberTap(int index) {
    read.selectQuestion(index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onCompleteTap() async {
    await read.saveTest();
    Navigator.pushReplacementNamed(context, AppRoutes.testResult);
  }
}
