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
  Future<List<CatBreedModel>> getCatBreeds(int limit, int page) async {
    try{
      final url = "$baseUrl?api_key=$apiKey&limit=$limit&page=$page";
      final response = await HttpWrapper.get(
        client: client,
        url: url,
        headers: header,
      );
      if(response.statusCode == 200){
        return catBreedsModelFromJson(response.body);
      }else{
        //TODO: Terminar
        // await loggingRepository.logMessage(
        //   "startWorkshift /worker/iniciarTurno/$workerId EXCEPTION: BODY: none RESPONSE: ${response.body}",
        // );
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