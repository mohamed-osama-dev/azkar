import 'package:flutter/foundation.dart';
import '../../domain/entities/zikr_entity.dart';

class ZikrProgressProvider extends ChangeNotifier {
  Map<int, int> _progressMap = {};
  List<ZikrEntity> _currentZikrList = [];

  Map<int, int> get progressMap => _progressMap;

  void initProgress(List<ZikrEntity> zikrList) {
    _currentZikrList = zikrList;
    _progressMap = {};
    for (int i = 0; i < zikrList.length; i++) {
      _progressMap[i] = zikrList[i].repeatCount;
    }
    notifyListeners();
  }

  void decrement(int index) {
    if (_progressMap.containsKey(index) && _progressMap[index]! > 0) {
      _progressMap[index] = _progressMap[index]! - 1;
      notifyListeners();
    }
  }

  bool isComplete(int index) {
    return _progressMap[index] == 0;
  }

  bool get allComplete {
    if (_progressMap.isEmpty) return false;
    return _progressMap.values.every((count) => count == 0);
  }

  int get remainingCount {
    if (_progressMap.isEmpty) return 0;
    return _progressMap.values.where((count) => count > 0).length;
  }

  int get completedCount {
    if (_progressMap.isEmpty) return 0;
    return _progressMap.values.where((count) => count == 0).length;
  }

  void reset() {
    if (_currentZikrList.isNotEmpty) {
      initProgress(_currentZikrList);
    }
  }
}
