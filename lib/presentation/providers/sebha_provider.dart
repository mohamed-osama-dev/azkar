import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SebhaProvider extends ChangeNotifier {
  static const String _counterKey = 'sebha_counter';
  static const String _zikrKey = 'sebha_current_zikr';

  int _counter = 0;
  String _currentZikr = 'سبحان الله';

  int get counter => _counter;
  String get currentZikr => _currentZikr;

  SebhaProvider() {
    loadPersistedCount();
  }

  Future<void> loadPersistedCount() async {
    final prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt(_counterKey) ?? 0;
    _currentZikr = prefs.getString(_zikrKey) ?? 'سبحان الله';
    notifyListeners();
  }

  Future<void> increment() async {
    _counter++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey, _counter);
    notifyListeners();
  }

  Future<void> reset() async {
    _counter = 0;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey, _counter);
    notifyListeners();
  }

  Future<void> setZikr(String zikr) async {
    _currentZikr = zikr;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_zikrKey, _currentZikr);
    notifyListeners();
  }
}
