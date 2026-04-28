import '../entities/azkar_entity.dart';
import '../repositories/azkar_repository.dart';

class GetAllAzkarUseCase {
  final AzkarRepository repository;

  GetAllAzkarUseCase(this.repository);

  Future<List<AzkarEntity>> call() async {
    return await repository.getAllAzkar();
  }
}
