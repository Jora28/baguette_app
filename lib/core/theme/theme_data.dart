import 'package:baguette_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  dark,
  light,
}

class BaguetteThems {
  static AppTheme currentTheme = AppTheme.light;
  final Map<AppTheme, ThemeData> appThemeData = {
    AppTheme.dark: ThemeData(primaryColor: AppColors.blue),
    AppTheme.light: ThemeData(primaryColor: AppColors.white),
  };
}
