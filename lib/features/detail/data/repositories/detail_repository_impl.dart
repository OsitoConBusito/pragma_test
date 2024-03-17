import 'package:dartz/dartz.dart';
import 'package:pragma_test/core/connection/network_info.dart';
import 'package:pragma_test/core/error/exceptions.dart';
import 'package:pragma_test/core/error/failure.dart';
import 'package:pragma_test/features/detail/data/datasource/detail_remote_datasource.dart';
import 'package:pragma_test/features/detail/domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  DetailRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final DetailRemoteDataSource remoteDataSource;
  // final PostListLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, String?>?> getCatBreedImage(String breed) async {
    if (await networkInfo.isConnected!) {
      try {
        final catBreeds = await remoteDataSource.getCatBreedImage(breed);
        // localDataSource.cachePostList(posts);
        return Right(catBreeds);
      } on ServerException {
        return const Left(ServerFailure(errorMessage: 'Exception from Server'));
      }
    } else {
      try {
        // final posts = await localDataSource.getCachedPostList();
        return Right('');
      } on CacheException {
        return const Left(CacheFailure(errorMessage: 'Exception from Cache'));
      }
    }
  }
}
