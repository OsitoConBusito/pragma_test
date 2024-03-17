import 'package:pragma_test/core/error/failure.dart';
import 'package:pragma_test/features/list/domain/entities/cat_breed.dart';
import 'package:dartz/dartz.dart';

abstract class ListRepository {
  Future<Either<Failure, List<CatBreed>?>?> getCatBreeds();
}
