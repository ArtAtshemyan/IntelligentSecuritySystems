import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 1,
      errorStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.red),
      contentPadding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
      labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
          fontSize: 12),
      hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
          fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.lightGrey,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.red,
          width: 2,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        minimumSize: const Size.fromHeight(40),
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.grey,
        disabledForegroundColor: AppColors.darkGrey,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: AppColors.lightBackground,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 1,
      errorStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.red),
      contentPadding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
      labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.lightBackground,
          fontSize: 12),
      hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.lightBackground,
          fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.lightBackground,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.red,
          width: 2,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 26),
        minimumSize: const Size.fromHeight(40),
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.lightGrey,
        disabledForegroundColor: AppColors.darkGrey,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: AppColors.lightBackground,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
    ),
  );
}
