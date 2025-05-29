import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:apphud/models/sk_product/subscription_period_time_wrapper.dart';
import 'package:drivers_test/apphud_impl.dart';
import 'package:intl/intl.dart';

class PriceProductService {
  ///Примеры:
  /// $4,99 $0,38/week
  /// 4.99 Мы получаем цену за неделю, далее цену за первый платеж по скидке (19.99) делим на 52 так как в году 52 недели и не забываем обрезать до 2 знаков после запятой
  /// ${weekSub.getOnlyCurrencySign()}${(blackFridaySub.getIntroductoryOnlyOfferPrice()! / 52).toStringAsFixed(2)}/${weekSub.getPeriod()}
  ///
  /// $19.99 / first year
  /// ${blackFridaySub.getIntroductoryOfferPrice()} / first ${blackFridaySub.getIntroductoryOfferDuration()}
  ///
  /// then $59.99 / year
  /// "then ${blackFridaySub.getPriceAndDuration()}"

  final ApphudProduct _apphudProduct;

  PriceProductService(this._apphudProduct);

  ApphudProduct get apphudProduct => _apphudProduct;

  ///Получить период оплаты подписки
  ///ПРИМЕР: week
  String? _getPeriod({required bool omitOneUnit}) {
    final formattedString = _format(
      unit: _apphudProduct.getSKProduct.subscriptionPeriod?.unit,
      numberOfUnits:
          _apphudProduct.getSKProduct.subscriptionPeriod?.numberOfUnits,
      omitOneUnit: omitOneUnit,
    );

    return formattedString;
  }

  ///Получить цену основной подписки
  ///ПРИМЕР: $4.99
  String _getPrice() {
    final formatter = NumberFormat.currency(
      symbol: _apphudProduct.getSKProduct.priceLocale.currencySymbol,
    );

    return formatter.format(
      double.parse((_apphudProduct.getSKProduct.price).toStringAsFixed(2)),
    );
  }

  ///Получить знак валюты
  ///ПРИМЕР: $
  String getOnlyCurrencySign() {
    return _apphudProduct.getSKProduct.priceLocale.currencySymbol!;
  }

  ///Получить цену без доллара
  ///ПРИМЕР:4.99
  double getOnlyPrice() {
    return _apphudProduct.getSKProduct.price;
  }

  ///Сколько дней/месяцев/лет длится подписка по скидке
  ///ПРИМЕР: 1/2/3/6
  String? getIntroductoryOfferDurationNumber() {
    return _apphudProduct
        .getSKProduct
        .introductoryPrice
        ?.subscriptionPeriod
        .numberOfUnits
        .toString();
  }

  ///Сколько дней/месяцев/лет длится подписка по скидке
  ///ПРИМЕР: day/week/year
  String? getIntroductoryOfferDuration() {
    return _apphudProduct
        .getSKProduct
        .introductoryPrice
        ?.subscriptionPeriod
        .unit
        .name;
  }

  ///Сколько стоит подписка по скидке
  ///ПРИМЕР: $19.00
  ///Если пришло 0 значит она бесплатная
  String? getIntroductoryOfferPrice() {
    final formatter = NumberFormat.currency(
      symbol: _apphudProduct.getSKProduct.priceLocale.currencySymbol!,
    );

    if (_apphudProduct.getSKProduct.introductoryPrice?.price != null) {
      return formatter.format(
        double.parse(
          (_apphudProduct.getSKProduct.introductoryPrice!.price)
              .toStringAsFixed(2),
        ),
      );
    }
    return null;
  }

  ///Сколько стоит подписка по скидке без знака валюты
  ///ПРИМЕР: 19.00
  double? getIntroductoryOnlyOfferPrice() {
    return _apphudProduct.getSKProduct.introductoryPrice?.price;
  }

  ///3-day
  String? getTrialPeriod() {
    return "${getIntroductoryOfferDurationNumber()}-${getIntroductoryOfferDuration()}";
  }

  String getPriceAndDuration({required bool omitOneUnit}) {
    if (_getPeriod(omitOneUnit: omitOneUnit) != null) {
      return "${_getPrice()}/${_getPeriod(omitOneUnit: omitOneUnit)}";
    }
    return "${_getPrice()} for one-time payment";
  }

  String getPriceAndDurationWith({bool omitOneUnit = true}) {
    if (getIntroductoryOfferDurationNumber() != null &&
        getIntroductoryOfferDuration() != null) {
      return "${getPriceAndDuration(omitOneUnit: omitOneUnit)} with a ${getTrialPeriod()} free trial";
    }
    return getPriceAndDuration(omitOneUnit: omitOneUnit);
  }

  String getPriceAndDurationPlus({bool omitOneUnit = true}) {
    if (getIntroductoryOfferDurationNumber() != null &&
        getIntroductoryOfferDuration() != null) {
      return "${getPriceAndDuration(omitOneUnit: omitOneUnit)} + ${getTrialPeriod()} free trial";
    }
    return getPriceAndDuration(omitOneUnit: omitOneUnit);
  }
}

String? _format({
  required SKSubscriptionPeriodTime? unit,
  required int? numberOfUnits,
  required bool omitOneUnit,
}) {
  if (unit == null || numberOfUnits == null) return null;

  if (unit == SKSubscriptionPeriodTime.day && numberOfUnits == 7) {
    unit = SKSubscriptionPeriodTime.week;
    numberOfUnits = 1;
  }

  if (omitOneUnit && numberOfUnits == 1) {
    switch (unit) {
      case SKSubscriptionPeriodTime.day:
        return 'day';
      case SKSubscriptionPeriodTime.week:
        return 'week';
      case SKSubscriptionPeriodTime.month:
        return 'month';
      case SKSubscriptionPeriodTime.year:
        return 'year';
    }
  }

  return _formatTimeInterval(numberOfUnits, unit);
}

String _formatTimeInterval(int quantity, SKSubscriptionPeriodTime unit) {
  final pluralForms = {
    'en': {
      SKSubscriptionPeriodTime.day: ['day', 'days'],
      SKSubscriptionPeriodTime.week: ['week', 'weeks'],
      SKSubscriptionPeriodTime.month: ['month', 'months'],
      SKSubscriptionPeriodTime.year: ['year', 'years'],
    },
    // Add more languages and their plural forms here
  };

  final pluralForm = pluralForms['en']![unit]![quantity == 1 ? 0 : 1];
  return '$quantity $pluralForm';
}
