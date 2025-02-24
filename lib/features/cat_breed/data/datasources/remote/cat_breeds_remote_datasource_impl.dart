import 'dart:developer';
import 'dart:io';

import 'package:cat_breeds/core/constants.dart';
import 'package:cat_breeds/core/error/failures.dart';
import 'package:cat_breeds/core/http_wrapper.dart';
import 'package:cat_breeds/features/cat_breed/data/datasources/remote/cat_breeds_remote_datasource.dart';
import 'package:cat_breeds/features/cat_breed/data/models/cat_breed_model.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

class CatBreedsRemoteRepositoryDataSourceImpl implements CatBreedsRemoteRepositoryDataSource{

  final http.Client client;

  CatBreedsRemoteRepositoryDataSourceImpl({required this.client});
  
  @override
  Future<List<CatBreedModel>> getCatBreeds(int limit, int page, String searchText) async {
    final searchUrlSection = searchText.isNotEmpty ? "/search" : "";
    try{
      final url = "$baseUrl$searchUrlSection?api_key=$apiKey&limit=$limit&page=$page&q=$searchText";
      final response = await HttpWrapper.get(
        client: client,
        url: url,
        headers: header,
      );
      if(response.statusCode == 200){
        return catBreedsModelFromJson(response.body);
      }else{
        await Sentry.captureMessage(
          "URL: $searchUrlSection - METHOD: GET - RESPONSE: ${response.body}",
        );
        throw invalidDataFailureFromMap(response.body);
      }
    } on SocketException {
      throw NetworkFailure.exception;
    } on InvalidDataFailure{
      rethrow;
    }catch(e){
      await Sentry.captureMessage(
        "URL: $searchUrlSection - METHOD: GET - EXCEPTION: $e",
      );
      throw UnknownFailure.exception;
    }
  }

  @override
  Future<CatBreedModel> getCatBreed(String catBreedId) async {
    final url = "$baseUrl/$catBreedId?api_key=$apiKey";
    try{
      final response = await HttpWrapper.get(
        client: client,
        url: url,
        headers: header,
      );
      if(response.statusCode == 200){
        log(response.body);
        return catBreedModelFromJson(response.body);
      }else{
        await Sentry.captureMessage(
          "URL: $url - METHOD: GET - RESPONSE: ${response.body}",
        );
        throw invalidDataFailureFromMap(response.body);
      }
    } on SocketException {
      throw NetworkFailure.exception;
    } on InvalidDataFailure{
      rethrow;
    }catch(e){
      await Sentry.captureMessage(
        "URL: $url - METHOD: GET - EXCEPTION: $e",
      );
      throw UnknownFailure.exception;
    }
  }
}