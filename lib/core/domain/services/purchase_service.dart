import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_user_property_key.dart';
import 'package:drivers_test/core/core.dart';
import 'package:flutter/foundation.dart';

final ValueNotifier<bool> isSubscribed = ValueNotifier(false);
late PriceProductService weekProduct;
late PriceProductService weekTrialProduct;
late PriceProductService lifeTimeProduct;

class PurchaseService {
  Future initPriceProductService() async {
    final paywalls = (await Apphud.paywallsDidLoadCallback()).paywalls;

    for (ApphudPaywall paywall in paywalls) {
      for (var p in paywall.products!) {
        switch (p.productId) {
          case AppConstants.weekSubID:
            weekProduct = PriceProductService(p);
            break;
          case AppConstants.weekTrialSubID:
            weekTrialProduct = PriceProductService(p);
            break;
          case AppConstants.lifeTimeSubID:
            lifeTimeProduct = PriceProductService(p);
            break;
          default:
            break;
        }
      }
    }

    isSubscribed.value =
        (await Apphud.hasActiveSubscription() ||
            await Apphud.hasPremiumAccess());
  }

  Future<String?> purchase({
    required PriceProductService priceProductService,
  }) async {
    final result = await Apphud.purchase(
      product: priceProductService.apphudProduct,
    );

    if ((result.subscription?.isActive ?? false) ||
        (result.nonRenewingPurchase?.isActive ?? false) ||
        kDebugMode) {
      isSubscribed.value = true;
    } else if (result.error != null) {
      final error = result.error!;
      final message = '${error.message ?? 'Error'} ${error.errorCode ?? -1}';

      Apphud.setUserProperty(
        key: ApphudUserPropertyKey.customProperty('paywall_error'),
        value: message,
      );

      return error.message == null
          ? null
          : error.message!.contains('SKErrorDomain')
          ? null
          : error.message;
    }

    return null;
  }

  Future<String?> restore() async {
    final result = await Apphud.restorePurchases();

    if (result.subscriptions.any((element) => element.isActive) ||
        result.purchases.any((element) => element.isActive) ||
        kDebugMode) {
      isSubscribed.value = true;
    }

    return result.error?.message ?? result.error?.billingErrorTitle;
  }
}
