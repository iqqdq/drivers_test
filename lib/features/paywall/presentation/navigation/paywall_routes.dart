import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const _paywall = '/paywall/:type';

abstract class PaywallRoutes {
  static String get paywall => _paywall;

  static final List<GoRoute> routes = [
    GoRoute(
      path: _paywall,
      builder: (context, state) {
        final args = state.extra as PaywallType;
        return ChangeNotifierProvider<PaywallChangeNotifier>(
          create: (_) => PaywallChangeNotifier()..changeType(type: args),
          child: const PaywallScreen(),
        );
      },
    ),
  ];
}
