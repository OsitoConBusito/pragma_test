import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_test/core/config/endpoints.dart';
import 'package:pragma_test/core/connection/network_info.dart';
import 'package:pragma_test/core/error/failure.dart';
import 'package:pragma_test/features/detail/data/datasource/detail_remote_datasource.dart';
import 'package:pragma_test/features/detail/data/repositories/detail_repository_impl.dart';

class DetailNotifier extends StateNotifier<String?> {
  DetailNotifier({this.image, this.failure}) : super(null);

  String? image;
  Failure? failure;

  Future<void> eitherFailureOrCatBreedimage(String breed) async {
    DetailRepositoryImpl repositoryImpl = DetailRepositoryImpl(
      remoteDataSource: DeatilRemoteDataSourceImpl(
        dio: Dio(),
        endpoint: Endpoints.image,
      ),
      // localDataSource: PostListLocalDataSourceImpl(
      //   sharedPreferences: await SharedPreferences.getInstance(),
      // ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrPostList = await repositoryImpl.getCatBreedImage(breed);

    if (failureOrPostList == null) {
      failure = const ServerFailure(errorMessage: 'Empty Cat Breeds List');
      return;
    }

    failureOrPostList.fold(
      (newFailure) {
        state = null;
        image = null;
        failure = newFailure;
      },
      (newImage) {
        state = newImage!;
        image = newImage;
        failure = null;
      },
    );
  }
}
