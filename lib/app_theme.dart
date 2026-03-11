import 'package:flutter/material.dart';

abstract class AppColors {
  static const primary       = Color(0xFF5B6AF0);
  static const primaryLight  = Color(0xFFEEF0FF);
  static const primaryDark   = Color(0xFF3D4DC4);
  static const bg            = Color(0xFFF7F8FC);
  static const surface       = Colors.white;
  static const text          = Color(0xFF0D0E14);
  static const textSub       = Color(0xFF6B7280);
  static const textMuted     = Color(0xFF9CA3AF);
  static const border        = Color(0xFFF0F1F6);
  static const green         = Color(0xFF00C896);
  static const greenLight    = Color(0xFFE6FAF4);
  static const orange        = Color(0xFFFF9500);
  static const orangeLight   = Color(0xFFFFF4E5);
  static const red           = Color(0xFFFF6B6B);
  static const redLight      = Color(0xFFFFF0F0);
}

abstract class AppRadius {
  static const sm  = 10.0;
  static const md  = 16.0;
  static const lg  = 22.0;
  static const xl  = 28.0;
  static const full = 999.0;
}

abstract class AppShadow {
  static const card = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];
  static const elevated = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 28,
      offset: Offset(0, 8),
    ),
  ];
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.primary,
      surface: AppColors.surface,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bg,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.text),
      titleTextStyle: TextStyle(
        color: AppColors.text,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontFamily: 'Roboto',
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      height: 72,
      indicatorColor: AppColors.primaryLight,
      labelTextStyle: WidgetStateProperty.resolveWith((s) {
        final selected = s.contains(WidgetState.selected);
        return TextStyle(
          fontSize: 11,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          color: selected ? AppColors.primary : AppColors.textMuted,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((s) {
        final selected = s.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? AppColors.primary : AppColors.textMuted,
          size: 22,
        );
      }),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.border,
      selectedColor: AppColors.primary,
      secondarySelectedColor: AppColors.primary,
      labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.text),
      secondaryLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.full)),
      side: BorderSide.none,
    ),
  );
}
