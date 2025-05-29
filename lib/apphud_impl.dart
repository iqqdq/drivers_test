import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:apphud/models/sk_product/discount_wrapper.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sk_product/subscription_period_wrapper.dart';
import 'package:drivers_test/parser.dart';
import 'package:flutter/foundation.dart';

extension ApphudProductExtension on ApphudProduct {
  SKProductWrapper get getSKProduct {
    if (skProduct != null) {
      return skProduct!;
    } else {
      final Product? localProduct = LocalStoreKit.getProductById(productId);
      if (localProduct == null) {
        debugPrint('Product $productId not found in local StoreKit');
        throw Exception();
      }

      return SKProductWrapper(
        introductoryPrice:
            localProduct.introductoryOffer != null
                ? SKProductDiscountWrapper(
                  price: localProduct.introductoryOffer!.price,
                  numberOfPeriods:
                      localProduct.introductoryOffer!.numberOfPeriods ?? 0,
                  paymentMode: localProduct.introductoryOffer!.paymentMode,
                  priceLocale: SKPriceLocaleWrapper(
                    currencySymbol: "\$",
                    currencyCode: "USD",
                  ),
                  subscriptionPeriod: SKProductSubscriptionPeriodWrapper(
                    numberOfUnits:
                        localProduct
                            .introductoryOffer!
                            .subscriptionPeriod
                            .numberOfUnits,
                    unit:
                        localProduct.introductoryOffer!.subscriptionPeriod.unit,
                  ),
                )
                : null,
        subscriptionPeriod:
            localProduct.subscriptionPeriod != null
                ? SKProductSubscriptionPeriodWrapper(
                  numberOfUnits: localProduct.subscriptionPeriod!.numberOfUnits,
                  unit: localProduct.subscriptionPeriod!.unit,
                )
                : null,
        productIdentifier: localProduct.productId,
        localizedTitle: "",
        localizedDescription: "",
        price: double.parse(localProduct.displayPrice),
        priceLocale: SKPriceLocaleWrapper(
          currencySymbol: "\$",
          currencyCode: "USD",
        ),
      );
    }
  }
}
