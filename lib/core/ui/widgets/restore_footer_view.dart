import 'package:drivers_test/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class RestoreFooterView extends StatelessWidget {
  final VoidCallback onTap;

  const RestoreFooterView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final titles = [
      AppTitles.termsOfUse,
      AppTitles.restore,
      AppTitles.privacyPolicy,
    ];

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
              onPressed: () => _onTap(index),
            ),
          ),
        );
      }),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onTap(int index) {
    index == 1
        ? onTap()
        : launchUrl(
          Uri.parse(
            index == 0 ? AppConstants.termsOfUse : AppConstants.privacyUrl,
          ),
        );
  }
}
