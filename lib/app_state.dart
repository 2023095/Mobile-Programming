import 'package:flutter/material.dart';
import 'package:flutter_demo/services/local_storage/local_storage.dart';
import 'package:flutter_demo/services/service_locator.dart';

class AppState extends ChangeNotifier {
  final localStorage = getIt<LocalStorage>();

  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;

  Locale? _locale;
  Locale? get locale => _locale;

  Future<void> init() async {
    _theme = localStorage.getTheme();
    _locale = localStorage.getLocale();
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode theme) async {
    _theme = theme;
    await localStorage.setTheme(theme);
    notifyListeners();
  }

  Future<void> setLocale(Locale? locale) async {
    _locale = locale;
    await localStorage.setLocale(locale);
    notifyListeners();
  }
}
