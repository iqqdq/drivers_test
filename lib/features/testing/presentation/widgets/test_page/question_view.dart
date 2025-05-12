import 'package:drivers_test/features/testing/domain/domain.dart';
import 'package:drivers_test/features/testing/presentation/widgets/test_page/answer_tile.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class QuestionView extends StatefulWidget {
  final QuestionEntity question;
  final bool ingoreGesture;
  final Function(int answer) onTap;

  const QuestionView({
    super.key,
    required this.question,
    required this.ingoreGesture,
    required this.onTap,
  });

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView>
    with AutomaticKeepAliveClientMixin {
  int? _index;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ).copyWith(bottom: MediaQuery.of(context).padding.bottom),
      children: [
        /// IMAGE
        widget.question.image == null
            ? SizedBox.shrink()
            : Container(
              margin: EdgeInsets.only(bottom: 24.0),
              height: 248.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(widget.question.image!, fit: BoxFit.cover),
              ),
            ),

        /// QUESTION
        Text(
          widget.question.text,
          textAlign: TextAlign.start,
          style: AppTextStyles.headlineTitle1,
        ),
        const SizedBox(height: 24.0),

        /// ANSWER'S
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.question.answers.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.0),
          itemBuilder: (context, index) {
            bool isSelected = _index == index;
            bool? isCorrect =
                _index == null ? null : index == widget.question.correct;

            return AnswerTile(
              text: widget.question.answers[index],
              isSelected: isSelected,
              isCorrect: isCorrect,
              onTap:
                  widget.ingoreGesture
                      ? null
                      : widget.question.answer == null
                      ? () => _onAnswerTap(index)
                      : null,
            );
          },
        ),
      ],
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onAnswerTap(int index) {
    _index = index;
    widget.onTap(index);
  }
}
