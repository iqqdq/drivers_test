import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

import 'paywall_switch.dart';

class PaywallPage extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final Function(bool value) onChanged;

  const PaywallPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onChanged,
  });

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    final subtitle =
        '${widget.subtitle} ${weekTrialProduct.getPriceAndDurationPlus()}';
    final switchTitle =
        _value
            ? '${weekTrialProduct.getTrialPeriod()} ${AppTitles.freeTrial} ${AppTitles.enabled}'
            : '${AppTitles.enable} ${weekTrialProduct.getTrialPeriod()} ${AppTitles.freeTrial}';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // IMAGE
          Expanded(child: Image.asset(widget.image, fit: BoxFit.fitWidth)),

          /// TITLE
          Text(
            widget.title,
            style: AppTextStyles.headlineTitle1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),

          /// SUBTITLE
          Text(
            subtitle,
            style: AppTextStyles.subheadlineRegular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),

          /// SWITCH
          PaywallSwitch(
            title: switchTitle,
            value: _value,
            onChanged: _onSwitchTap,
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTIONS

  void _onSwitchTap(bool value) {
    setState(() => _value = value);
    widget.onChanged(value);
  }
}
