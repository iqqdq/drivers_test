import 'package:apphud/apphud.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Injection's
  await initInjections();
  // Apphud
  await Apphud.start(apiKey: AppConstants.apphudId);
  // StoreKit
  await LocalStoreKit.initialize();
  // Product Price Service
  await sl.get<PurchaseService>().initPriceProductService();
  // Notification's
  await sl.get<NotificationService>().init();

  runApp(const App());
}
