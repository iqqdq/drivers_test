import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bgPrimary,
    useMaterial3: true,
  );
}
