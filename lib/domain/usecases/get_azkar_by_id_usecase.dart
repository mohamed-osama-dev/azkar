import '../entities/azkar_entity.dart';
import '../repositories/azkar_repository.dart';

class GetAzkarByIdUseCase {
  final AzkarRepository repository;

  GetAzkarByIdUseCase(this.repository);

  Future<AzkarEntity?> call(int id) async {
    return await repository.getAzkarById(id);
  }
}
