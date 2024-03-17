import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_test/core/config/endpoints.dart';
import 'package:pragma_test/core/connection/network_info.dart';
import 'package:pragma_test/core/error/failure.dart';
import 'package:pragma_test/features/list/data/datasource/list_remote_datasource.dart';
import 'package:pragma_test/features/list/data/models/cat_breed_model.dart';
import 'package:pragma_test/features/list/data/repositories/list_repository_impl.dart';

class ListNotifier extends StateNotifier<List<CatBreedModel>> {
  ListNotifier({this.catBreeds, this.failure}) : super(<CatBreedModel>[]);

  List<CatBreedModel>? catBreeds;
  Failure? failure;

  Future<void> eitherFailureOrCatBreedsList() async {
    ListRepositoryImpl repositoryImpl = ListRepositoryImpl(
      remoteDataSource: ListRemoteDataSourceImpl(
        dio: Dio(),
        endpoint: Endpoints.catBreeds,
      ),
      // localDataSource: PostListLocalDataSourceImpl(
      //   sharedPreferences: await SharedPreferences.getInstance(),
      // ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrPostList = await repositoryImpl.getCatBreeds();

    if (failureOrPostList == null) {
      failure = const ServerFailure(errorMessage: 'Empty Cat Breeds List');
      return;
    }

    failureOrPostList.fold(
      (newFailure) {
        state = [];
        catBreeds = null;
        failure = newFailure;
      },
      (newcatBreedsList) {
        state = newcatBreedsList!;
        catBreeds = newcatBreedsList;
        failure = null;
      },
    );
  }
}
