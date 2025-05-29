import 'dart:convert';

import 'package:apphud/models/sk_product/discount_payment_mode_wrapper.dart';
import 'package:apphud/models/sk_product/subscription_period_time_wrapper.dart';
import 'package:flutter/services.dart';

class LocalStoreKit {
  static late StoreKitContent _content;

  static Future<void> initialize() async {
    final content = await rootBundle.loadString('ios/Premium.storekit');
    _content = StoreKitContent.fromJson(json.decode(content));
  }

  static Product? getProductById(String productId) {
    return _content.products
        .where((product) => product.productId == productId)
        .firstOrNull;
  }
}

class StoreKitContent {
  final List<Product> products;

  StoreKitContent({required this.products});

  factory StoreKitContent.fromJson(Map<String, dynamic> json) {
    final products = <Product>[];

    // Парсинг всех типов продуктов
    if (json['nonRenewingSubscriptions'] != null) {
      products.addAll(
        (json['nonRenewingSubscriptions'] as List).map(
          (e) => Product.fromJson(e),
        ),
      );
    }

    if (json['products'] != null) {
      products.addAll(
        (json['products'] as List).map((e) => Product.fromJson(e)),
      );
    }

    if (json['subscriptionGroups'] != null) {
      for (final group in json['subscriptionGroups']) {
        products.addAll(
          (group['subscriptions'] as List).map((e) => Product.fromJson(e)),
        );
      }
    }

    return StoreKitContent(products: products);
  }
}

class Product {
  final String productId;
  final String displayPrice;
  final SubscriptionPeriod? subscriptionPeriod;
  final IntroductoryOffer? introductoryOffer;

  Product({
    required this.productId,
    required this.displayPrice,
    this.subscriptionPeriod,
    this.introductoryOffer,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productID'],
      displayPrice: json['displayPrice'],
      subscriptionPeriod:
          json['recurringSubscriptionPeriod'] != null
              ? SubscriptionPeriod.fromJson(json['recurringSubscriptionPeriod'])
              : null,
      introductoryOffer:
          json['introductoryOffer'] != null
              ? IntroductoryOffer.fromJson(json['introductoryOffer'])
              : null,
    );
  }
}

class SubscriptionPeriod {
  final SKSubscriptionPeriodTime unit;
  final int numberOfUnits;

  const SubscriptionPeriod({required this.unit, required this.numberOfUnits});

  factory SubscriptionPeriod.fromJson(String periodString) {
    // Реализация парсинга строки в формате ISO 8601 (PnYnMnWnD)
    if (!periodString.startsWith('P')) {
      throw const FormatException("Period string must start with 'P'");
    }

    final duration = periodString.substring(1);
    final pattern = RegExp(r'^(\d+)([YMWD])$');
    final match = pattern.firstMatch(duration);

    if (match == null) {
      throw const FormatException("Invalid period format");
    }

    final number = int.parse(match.group(1)!);
    final unitChar = match.group(2)!;

    final unit = switch (unitChar) {
      'Y' => SKSubscriptionPeriodTime.year,
      'M' => SKSubscriptionPeriodTime.month,
      'W' => SKSubscriptionPeriodTime.week,
      'D' => SKSubscriptionPeriodTime.day,
      _ => throw const FormatException("Unsupported time unit"),
    };

    return SubscriptionPeriod(unit: unit, numberOfUnits: number);
  }

  @override
  String toString() => 'P$numberOfUnits$unit';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubscriptionPeriod &&
          runtimeType == other.runtimeType &&
          unit == other.unit &&
          numberOfUnits == other.numberOfUnits;

  @override
  int get hashCode => Object.hash(unit, numberOfUnits);
}

enum PeriodUnit {
  day,
  week,
  month,
  year;

  String toSymbol() => switch (this) {
    PeriodUnit.day => 'D',
    PeriodUnit.week => 'W',
    PeriodUnit.month => 'M',
    PeriodUnit.year => 'Y',
  };
}

class IntroductoryOffer {
  final SKProductDiscountPaymentMode paymentMode;
  final SubscriptionPeriod subscriptionPeriod;
  final int? numberOfPeriods;
  final String? displayPrice;

  const IntroductoryOffer({
    required this.paymentMode,
    required this.subscriptionPeriod,
    required this.numberOfPeriods,
    required this.displayPrice,
  });

  factory IntroductoryOffer.fromJson(Map<String, dynamic> json) {
    return IntroductoryOffer(
      paymentMode: _parsePaymentMode(json['paymentMode'] as String),
      subscriptionPeriod: SubscriptionPeriod.fromJson(
        json['subscriptionPeriod'] as String,
      ),
      numberOfPeriods: json['numberOfPeriods'] as int?,
      displayPrice:
          json.containsKey('displayPrice')
              ? json['displayPrice'] as String
              : null,
    );
  }

  static SKProductDiscountPaymentMode _parsePaymentMode(String mode) {
    return switch (mode) {
      'free' => SKProductDiscountPaymentMode.freeTrail,
      'payAsYouGo' => SKProductDiscountPaymentMode.payAsYouGo,
      'payUpFront' => SKProductDiscountPaymentMode.payUpFront,
      _ => throw ArgumentError('Invalid payment mode: $mode'),
    };
  }

  double get price => double.tryParse(displayPrice ?? "") ?? 0;

  @override
  String toString() {
    return 'IntroductoryOffer('
        'paymentMode: $paymentMode, '
        'subscriptionPeriod: $subscriptionPeriod, '
        'numberOfPeriods: $numberOfPeriods, '
        'price: $displayPrice)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntroductoryOffer &&
          runtimeType == other.runtimeType &&
          paymentMode == other.paymentMode &&
          subscriptionPeriod == other.subscriptionPeriod &&
          numberOfPeriods == other.numberOfPeriods &&
          displayPrice == other.displayPrice;

  @override
  int get hashCode => Object.hash(
    paymentMode,
    subscriptionPeriod,
    numberOfPeriods,
    displayPrice,
  );
}
