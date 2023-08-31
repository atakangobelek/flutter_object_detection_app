import 'package:flutter/material.dart';
import '/theme/theme_colors.dart';
import '/theme/typography.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: themeColor,
  textTheme: themeText,
  navigationDrawerTheme: const NavigationDrawerThemeData().copyWith(
    backgroundColor: themeColor.surface,
    indicatorSize: const Size(double.maxFinite, 200),
    indicatorColor: themeColor.primaryContainer,
  ),
  elevatedButtonTheme: elevatedButtonTheme,
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: themeColor.primary,
    textStyle: themeText.labelLarge,
    elevation: 5,
  ),
);

