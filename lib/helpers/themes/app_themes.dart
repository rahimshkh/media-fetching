import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'app_bar_theme.dart';
import 'app_color_scheme.dart';

ThemeData themeData = ThemeData(
  primaryColor: AppColors.kPrimaryColor,
  brightness: Brightness.light,
  colorScheme: colorScheme,
  appBarTheme: appBarTheme,
  scaffoldBackgroundColor: AppColors.kScaffoldBGColor,
);
