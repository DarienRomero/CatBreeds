import 'dart:io';

import 'package:cat_breeds/core/constants.dart';
import 'package:cat_breeds/core/error/failures.dart';
import 'package:cat_breeds/core/http_wrapper.dart';
import 'package:cat_breeds/features/cat_breed/data/datasources/remote/cat_breeds_remote_datasource.dart';
import 'package:cat_breeds/features/cat_breed/data/models/cat_breed_model.dart';
import 'package:http/http.dart' as http;

class CatBreedsRemoteRepositoryDataSourceImpl implements CatBreedsRemoteRepositoryDataSource{

  final http.Client client;

  CatBreedsRemoteRepositoryDataSourceImpl({required this.client});
  
  @override
  Future<List<CatBreedModel>> getCatBreeds(int limit, int page, String searchText) async {
    try{
      final searchUrlSection = searchText.isNotEmpty ? "/search" : "";
      final url = "$baseUrl$searchUrlSection?api_key=$apiKey&limit=$limit&page=$page&q=$searchText";
      final response = await HttpWrapper.get(
        client: client,
        url: url,
        headers: header,
      );
      if(response.statusCode == 200){
        return catBreedsModelFromJson(response.body);
      }else{
        throw invalidDataFailureFromMap(response.body);
      }
    } on SocketException {
      throw NetworkFailure.exception;
    } on InvalidDataFailure{
      rethrow;
    }catch(e){
      throw UnknownFailure.exception;
    }
  }

  @override
  Future<CatBreedModel> getCatBreed(String catBreedId) async {
    try{
      final url = "$baseUrl/$catBreedId?api_key=$apiKey";
      final response = await HttpWrapper.get(
        client: client,
        url: url,
        headers: header,
      );
      if(response.statusCode == 200){
        return catBreedModelFromJson(response.body);
      }else{
        throw invalidDataFailureFromMap(response.body);
      }
    } on SocketException {
      throw NetworkFailure.exception;
    } on InvalidDataFailure{
      rethrow;
    }catch(e){
      throw UnknownFailure.exception;
    }
  }
}