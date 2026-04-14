
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryNavy,
    scaffoldBackgroundColor: AppColors.primaryNavy,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.textWhite, fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: AppColors.textWhite, fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentCyan,
        foregroundColor: AppColors.primaryNavy,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5), // لون رمادي فاتح
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent, 
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
  );
  
}