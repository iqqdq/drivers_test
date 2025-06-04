import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

class GetPremiumScreen extends StatelessWidget {
  const GetPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),

          /// TITLE
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              AppTitles.getPremium,
              style: AppTextStyles.headlineTitle1.copyWith(
                color: AppColors.black100,
              ),
            ),
          ),
          const SizedBox(height: 8.0),

          /// SUBTITLE
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              AppTitles.unlockFullAccess,
              style: AppTextStyles.textSubheadline.copyWith(
                color: AppColors.black70,
              ),
            ),
          ),
          const SizedBox(height: 12.0),

          /// SUBSCRIPTION LIST VIEW
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 12.0),
              itemCount: 3,
              separatorBuilder:
                  (context, index) => const Divider(
                    height: 1.0,
                    color: AppColors.border,
                    indent: 16.0,
                  ),
              itemBuilder: (context, index) {
                final title =
                    index == 0
                        ? weekProduct.getPriceAndDuration(omitOneUnit: true)
                        : index == 1
                        ? weekTrialProduct.getPriceAndDurationPlus()
                        : '${lifeTimeProduct.getOnlyCurrencySign()}${lifeTimeProduct.getOnlyPrice()}/${AppTitles.lifetime}';
                return SubsctiptionTile(
                  title: title,
                  onTap: () => _onSubscriptionTap(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onSubscriptionTap(int index) async {
    final type =
        index == 0
            ? PaywallType.week
            : index == 1
            ? PaywallType.weektrial
            : PaywallType.lifetime;
    router.push(PaywallRoutes.paywall, extra: type);
  }
}
