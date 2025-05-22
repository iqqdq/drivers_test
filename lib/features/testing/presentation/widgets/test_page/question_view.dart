import 'package:cached_network_image/cached_network_image.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class QuestionView extends StatefulWidget {
  final QuestionEntity question;
  final Function(int answer) onTap;

  const QuestionView({super.key, required this.question, required this.onTap});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView>
    with AutomaticKeepAliveClientMixin {
  int? _index;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _index = widget.question.answer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ).copyWith(bottom: getBottomPadding(context)),
      children: [
        /// IMAGE
        widget.question.image == null
            ? SizedBox.shrink()
            : widget.question.image!.isEmpty
            ? SizedBox.shrink()
            : Container(
              margin: EdgeInsets.only(bottom: 24.0),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  imageUrl: widget.question.image!,
                  fit: BoxFit.fitWidth,
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) =>
                          LoadingIndicator(color: AppColors.black100),
                ),
              ),
            ),

        /// QUESTION
        Text(
          widget.question.question,
          textAlign: TextAlign.start,
          style: AppTextStyles.headlineTitle1,
        ),
        const SizedBox(height: 24.0),

        /// CHOISE'S
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.question.choices.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.0),
          itemBuilder: (context, index) {
            bool isSelected = _index == index;
            bool? isCorrect =
                _index == null ? null : index == widget.question.correct;

            return QuestionTile(
              text: widget.question.choices[index],
              isSelected: isSelected,
              isCorrect: isCorrect,
              onTap: _index == null ? () => _onChioceTap(index) : null,
            );
          },
        ),
      ],
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onChioceTap(int index) {
    _index = index;
    widget.onTap(index);
  }
}
