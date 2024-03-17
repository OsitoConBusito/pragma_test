import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pragma_test/core/error/exceptions.dart';
import 'package:pragma_test/features/detail/data/models/cat_breed_image.dart';

abstract class DetailRemoteDataSource {
  Future<String?> getCatBreedImage(String breed);
}

class DeatilRemoteDataSourceImpl implements DetailRemoteDataSource {
  DeatilRemoteDataSourceImpl({
    required this.dio,
    required this.endpoint,
  });

  final Dio dio;
  final String endpoint;

  @override
  Future<String?> getCatBreedImage(String breed) async {
    final response = await dio.get(
      endpoint,
      queryParameters: {
        'breed_ids': breed,
      },
      options: Options(
        headers: {
          'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
        },
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      return CatBreedImage.fromList(response.data)?.first.url;
    } else {
      throw ServerException();
    }
  }
}
