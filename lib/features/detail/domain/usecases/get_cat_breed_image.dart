import 'package:dartz/dartz.dart';
import 'package:pragma_test/core/error/failure.dart';
import 'package:pragma_test/features/detail/domain/repositories/detail_repository.dart';

class GetCatBreedImageUseCase {
  GetCatBreedImageUseCase({required DetailRepository repository})
      : _repository = repository;

  final DetailRepository _repository;

  Future<Either<Failure, String?>?> call(
    String breed,
  ) async {
    return await _repository.getCatBreedImage(breed);
  }
}
