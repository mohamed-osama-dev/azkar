import '../entities/azkar_entity.dart';

abstract class AzkarRepository {
  Future<List<AzkarEntity>> getAllAzkar();
  Future<AzkarEntity?> getAzkarById(int id);
}
