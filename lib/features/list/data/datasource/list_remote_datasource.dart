import 'dart:io';

import 'package:pragma_test/core/error/exceptions.dart';
import 'package:pragma_test/features/list/data/models/cat_breed_model.dart';
import 'package:dio/dio.dart';

abstract class ListRemoteDataSource {
  Future<List<CatBreedModel>?> getCatBreeds();
}

class ListRemoteDataSourceImpl implements ListRemoteDataSource {
  ListRemoteDataSourceImpl({
    required this.dio,
    required this.endpoint,
  });

  final Dio dio;
  final String endpoint;

  @override
  Future<List<CatBreedModel>?> getCatBreeds() async {
    final response = await dio.get(endpoint);
    if (response.statusCode == HttpStatus.ok) {
      return CatBreedModel.fromList(response.data);
    } else {
      throw ServerException();
    }
  }
}
