import 'package:dartz/dartz.dart';
import 'package:pragma_test/core/connection/network_info.dart';
import 'package:pragma_test/core/error/exceptions.dart';
import 'package:pragma_test/core/error/failure.dart';
import 'package:pragma_test/features/list/data/datasource/list_remote_datasource.dart';
import 'package:pragma_test/features/list/data/models/cat_breed_model.dart';
import 'package:pragma_test/features/list/domain/repositories/list_repository.dart';

class ListRepositoryImpl implements ListRepository {
  ListRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final ListRemoteDataSource remoteDataSource;
  // final PostListLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<CatBreedModel>?>?> getCatBreeds() async {
    if (await networkInfo.isConnected!) {
      try {
        final catBreeds = await remoteDataSource.getCatBreeds();
        // localDataSource.cachePostList(posts);
        return Right(catBreeds);
      } on ServerException {
        return const Left(ServerFailure(errorMessage: 'Exception from Server'));
      }
    } else {
      try {
        // final posts = await localDataSource.getCachedPostList();
        return Right([]);
      } on CacheException {
        return const Left(CacheFailure(errorMessage: 'Exception from Cache'));
      }
    }
  }
}
