import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class OnboardingFooterView extends StatelessWidget {
  final List<String> titles;
  final Function(int index) onTap;

  const OnboardingFooterView({
    super.key,
    required this.titles,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(titles.length, (index) {
        return Expanded(
          child: Center(
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text(
                titles[index],
                style: AppTextStyles.caption1Regular.copyWith(
                  color: AppColors.black50,
                ),
              ),
              onPressed: () => onTap(index),
            ),
          ),
        );
      }),
    );
  }
}
