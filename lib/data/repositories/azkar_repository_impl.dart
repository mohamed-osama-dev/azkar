import '../../domain/entities/azkar_entity.dart';
import '../../domain/repositories/azkar_repository.dart';
import '../datasources/azkar_local_datasource.dart';

class AzkarRepositoryImpl implements AzkarRepository {
  final AzkarLocalDatasource datasource;

  AzkarRepositoryImpl(this.datasource);

  @override
  Future<List<AzkarEntity>> getAllAzkar() async {
    return datasource.getAllAzkar();
  }

  @override
  Future<AzkarEntity?> getAzkarById(int id) async {
    return datasource.getAzkarById(id);
  }
}
