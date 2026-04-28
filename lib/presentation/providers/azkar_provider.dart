import 'package:flutter/foundation.dart';
import '../../domain/entities/azkar_entity.dart';
import '../../domain/usecases/get_all_azkar_usecase.dart';

class AzkarProvider extends ChangeNotifier {
  final GetAllAzkarUseCase _getAllAzkarUseCase;

  List<AzkarEntity> _azkarList = [];
  bool _isLoading = false;

  List<AzkarEntity> get azkarList => _azkarList;
  bool get isLoading => _isLoading;

  AzkarProvider(this._getAllAzkarUseCase) {
    loadAzkar();
  }

  Future<void> loadAzkar() async {
    _isLoading = true;
    notifyListeners();

    _azkarList = await _getAllAzkarUseCase();
    _isLoading = false;
    notifyListeners();
  }

  AzkarEntity? getAzkarById(int id) {
    if (id >= 0 && id < _azkarList.length) {
      return _azkarList[id];
    }
    return null;
  }
}
