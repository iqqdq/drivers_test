import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/presentation/presentation.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class TestTile extends StatelessWidget {
  final int index;
  final String name;
  final int? accuracy;
  final int correct;
  final int total;
  final VoidCallback onTap;

  const TestTile({
    super.key,
    required this.index,
    required this.name,
    this.accuracy,
    required this.correct,
    required this.total,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20.0);
    final accuracyColor =
        accuracy == null
            ? AppColors.black100
            : accuracy! < 80
            ? AppColors.orange100
            : AppColors.green100;

    return Material(
      color: AppColors.card,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 76.0,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(width: 1.0, color: AppColors.border),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  /// NUMBER
                  NumberView(index: index),
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// TITLE
                        Text(name, style: AppTextStyles.headlineHeadline),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            /// ACCURACY
                            accuracy == null
                                ? SizedBox.shrink()
                                : Text(
                                  '${AppTitles.testAccuracy} $accuracy%',
                                  style: AppTextStyles.caption.copyWith(
                                    color: accuracyColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    '$correct/$total',
                    style: AppTextStyles.subheadlineRegular.copyWith(
                      color: accuracyColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
