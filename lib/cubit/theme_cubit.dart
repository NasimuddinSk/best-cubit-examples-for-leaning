import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static final ThemeData _darkTheme = ThemeData.dark();
  static final ThemeData _lightTheme = ThemeData.light();

  ThemeCubit() : super(ThemeState(themeData: _lightTheme));

  void togleTheme(bool isDark) {
    final ThemeData themeData = isDark ? _darkTheme : _lightTheme;
    emit(ThemeState(themeData: themeData));
    _saveThme(isDark);
  }

  Future<void> _saveThme(bool isDark) async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    _preferences.setBool("isDark", isDark);
  }

  static Future<bool> _loadThme() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    return _preferences.getBool("isDark") ?? false;
  }

  Future<void> initialThme() async {
    final bool isDark = await _loadThme();
    final ThemeData themeData = isDark ? _darkTheme : _lightTheme;
    emit(ThemeState(themeData: themeData));
  }
}
