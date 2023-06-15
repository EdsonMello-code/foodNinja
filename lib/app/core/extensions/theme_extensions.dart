import 'package:flutter/material.dart';
import 'package:foodninja/app/core/theme/app_theme.dart';

extension ThemeExtensions on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
