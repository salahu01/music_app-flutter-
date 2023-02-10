import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/app/configs/themes/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static final dark = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.background,
        systemNavigationBarDividerColor: AppColors.background,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.accent,
      ),
    ),
  );
}
