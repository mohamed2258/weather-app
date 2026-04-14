// lib/cubit/theme/theme_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  // بنبدأ بالوضع المظلم كافتراضي
  ThemeCubit() : super(ThemeMode.dark) {
    _loadTheme(); // أول ما التطبيق يفتح، بنقرأ الـ Theme المحفوظ
  }

  static const String _themeKey = "isDarkMode";

  // دالة لقراءة الـ Theme المحفوظ
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    // لو مفيش قيمة محفوظة، بنفترض إنه Dark Mode (عشان ده الستايل المفضل للتطبيق)
    final isDark = prefs.getBool(_themeKey) ?? true; 
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  // دالة لتغيير الـ Theme وحفظه
  Future<void> toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark); // حفظ الاختيار
    emit(isDark ? ThemeMode.dark : ThemeMode.light); // تحديث الـ UI
  }
}