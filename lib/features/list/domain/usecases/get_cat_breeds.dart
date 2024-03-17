import 'package:dartz/dartz.dart';
import 'package:pragma_test/core/error/failure.dart';
import 'package:pragma_test/core/usecases/usecases.dart';
import 'package:pragma_test/features/list/domain/entities/cat_breed.dart';
import 'package:pragma_test/features/list/domain/repositories/list_repository.dart';

class GetCatBreeds {
  GetCatBreeds({required ListRepository repository}) : _repository = repository;

  final ListRepository _repository;

  Future<Either<Failure, List<CatBreed>?>?> call(
    NoParams params,
  ) async {
    return await _repository.getCatBreeds();
  }
}
