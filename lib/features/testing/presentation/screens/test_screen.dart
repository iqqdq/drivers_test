import 'package:drivers_test/app/app.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final PageController _pageController = PageController();
  late List<GlobalKey> _numberKeys;
  late final TestChangeNotifier _read;

  @override
  void initState() {
    _read = context.read<TestChangeNotifier>();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<TestChangeNotifier>();
    _numberKeys = List.generate(watch.test.amount, (i) => GlobalKey());

    return Scaffold(
      appBar: CustomAppBar(
        title: watch.test.name,
        leading: CustomCloseButton(onTap: () => router.pop()),
        actions:
            watch.questions == null || watch.duration == null
                ? null
                : [TimerAppBarAction(duration: watch.duration!)],
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
                        final isCorrect =
                            question.answer == null
                                ? null
                                : question.answer == question.correct;

                        return NumberTile(
                          key: _numberKeys[index],
                          number: '${index + 1}',
                          isSelected: index == watch.index,
                          isCorrect: isCorrect,
                          onTap: () => _onNumberTap(index),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  /// QUESTION PAGE VIEW
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        if (notification is ScrollEndNotification) {
                          _onNumberTap(_pageController.page!.toInt());
                        }
                        return false;
                      },
                      child: PageView.builder(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        itemCount: watch.questions!.length,
                        itemBuilder: (context, index) {
                          final question = watch.questions![index];

                          return QuestionView(
                            question: question,
                            onTap: (index) => _onChoiceTap(question, index),
                          );
                        },
                      ),
                    ),
                  ),

                  /// COMPLETE BUTTON
                  _read.answers != null
                      ? SizedBox.shrink()
                      : watch.isTimeUp || watch.isTestCompleted
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

  void _scrollToIndex(int index) {
    final context = _numberKeys[index].currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: 0.5,
    );
  }

  void _onNumberTap(int index) async {
    _read.selectQuestion(index);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _scrollToIndex(index);
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onChoiceTap(QuestionEntity question, int index) =>
      _read.updateQuestion(question.copyWith(answer: index));

  void _onCompleteTap() async {
    await _read.saveResult();
    router.replace(TestRoutes.testResult, extra: _read.test);
  }
}
