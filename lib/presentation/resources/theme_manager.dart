import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.white,
      contentPadding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: AppPadding.p8,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.orange, width: AppSize.s1),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.gray, width: AppSize.s1),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.orange, width: AppSize.s1),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
