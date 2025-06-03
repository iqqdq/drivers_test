import 'package:flutter/foundation.dart';

enum PaywallType { week, weektrial, lifetime }

class PaywallChangeNotifier with ChangeNotifier {
  PaywallType _type = PaywallType.week;
  PaywallType get type => _type;

  void changeType({required PaywallType type}) {
    _type = type;
    notifyListeners();
  }
}
