import 'package:dartz/dartz.dart';
import 'package:pragma_test/core/error/failure.dart';

abstract class DetailRepository {
  Future<Either<Failure, String?>?> getCatBreedImage(String breed);
}
