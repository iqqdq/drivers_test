import 'package:drivers_test/app/app.dart';
import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const DriverTestApp());
}
