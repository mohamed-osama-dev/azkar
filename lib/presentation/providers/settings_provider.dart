import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_dimensions.dart';

class SettingsProvider extends ChangeNotifier {
  static const String _fontSizeKey = 'font_size';
  static const String _soundKey = 'sound_enabled';

  double _fontSize = AppDimensions.fontSizeDefault;
  bool _soundEnabled = true;

  double get fontSize => _fontSize;
  bool get soundEnabled => _soundEnabled;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _fontSize = prefs.getDouble(_fontSizeKey) ?? AppDimensions.fontSizeDefault;
    _soundEnabled = prefs.getBool(_soundKey) ?? true;
    notifyListeners();
  }

  Future<void> setFontSize(double size) async {
    _fontSize =
        size.clamp(AppDimensions.fontSizeMin, AppDimensions.fontSizeMax);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, _fontSize);
    notifyListeners();
  }

  Future<void> toggleSound() async {
    _soundEnabled = !_soundEnabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_soundKey, _soundEnabled);
    notifyListeners();
  }

  Future<void> setSoundEnabled(bool enabled) async {
    _soundEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_soundKey, _soundEnabled);
    notifyListeners();
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _fontSize = AppDimensions.fontSizeDefault;
    _soundEnabled = true;
    notifyListeners();
  }
}
