import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class ResultTile extends StatelessWidget {
  final ResultEntity result;
  final bool isDateHidden;
  final VoidCallback onTap;

  const ResultTile({
    super.key,
    required this.result,
    required this.isDateHidden,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isDateHidden
            ? SizedBox.shrink()
            : Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                result.completedAt.toDateString(),
                style: AppTextStyles.headlineHeadline,
              ),
            ),
        TestTile(
          index: normalizeTestId(result.testId),
          name: result.testName,
          accuracy: result.accuracy,
          correct: result.correct,
          total: result.testAmount,
          onTap: onTap,
        ),
      ],
    );
  }
}
