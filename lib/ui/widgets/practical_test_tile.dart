import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/practice/presentation/presetation.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class PracticalTestTile extends StatelessWidget {
  final int index;
  final String name;
  final int? accuracy;
  final int current;
  final int total;
  final VoidCallback onTap;

  const PracticalTestTile({
    super.key,
    required this.index,
    required this.name,
    this.accuracy,
    required this.current,
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
        highlightColor: AppColors.black10,
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
                        Text(
                          AppTitles.practicalTest,
                          style: AppTextStyles.headlineHeadline,
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            /// NAME
                            Text(
                              name + (accuracy == 0 ? '' : ' · '),
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.black70,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),

                            /// ACCURACY
                            accuracy == 0
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
                    '$current/$total',
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
