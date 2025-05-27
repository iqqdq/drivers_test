import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class ResultTile extends StatelessWidget {
  final TestEntity test;
  final bool isDateHidden;
  final VoidCallback onTap;

  const ResultTile({
    super.key,
    required this.test,
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
                test.result!.completedAt.toDateString(),
                style: AppTextStyles.headlineHeadline,
              ),
            ),
        TestTile(index: normalizeTestId(test.id), test: test, onTap: onTap),
      ],
    );
  }
}
