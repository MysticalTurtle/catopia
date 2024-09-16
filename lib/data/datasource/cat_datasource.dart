import 'dart:async';
import 'dart:convert';

import 'package:catopia/core/app_error.dart';
import 'package:catopia/data/model/cat_breed_model.dart';
import 'package:http/http.dart' as http;

abstract class CatDatasourceI {
  FutureOr<(List<CatBreedModel>, AppError?)> getCatBreeds(int limit, int page);
  FutureOr<(List<CatBreedModel>, AppError?)> searchCatBreed(String query);
}

class CatDatasource extends CatDatasourceI {
  CatDatasource();

  @override
  Future<(List<CatBreedModel>, AppError?)> getCatBreeds(
    int limit,
    int page,
  ) async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds?limit=$limit&page=$page'),
      headers: {
        'x-api-key':
            '''live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr''',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List<dynamic>;
      final bodyParsed = body.map((e) => e as Map<String, dynamic>);
      final resultList = bodyParsed.map(CatBreedModel.fromJson).toList();
      return (resultList, null);
    } else {
      return (
        <CatBreedModel>[],
        AppError(
          title: 'Error',
          message: 'Failed to load cat breeds',
          statusCode: response.statusCode,
        ),
      );
    }
  }

  @override
  Future<(List<CatBreedModel>, AppError?)> searchCatBreed(String query) async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds/search?q=$query'),
      headers: {
        'x-api-key':
            '''live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr''',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List<dynamic>;
      final bodyParsed = body.map((e) => e as Map<String, dynamic>);
      final resultList = bodyParsed.map(CatBreedModel.fromJson).toList();
      return (resultList, null);
    } else {
      throw Exception('Failed to search cat breeds');
    }
  }
}
