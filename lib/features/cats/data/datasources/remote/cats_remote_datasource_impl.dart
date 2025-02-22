import 'dart:io';

import 'package:cat_breeds/core/error/failures.dart';
import 'package:cat_breeds/features/cats/data/datasources/remote/cats_remote_datasource.dart';
import 'package:cat_breeds/features/cats/data/models/cat_model.dart';
import 'package:http/http.dart' as http;

class CatsRemoteRepositoryDataSourceImpl implements CatsRemoteRepositoryDataSource{

  final http.Client client;

  CatsRemoteRepositoryDataSourceImpl({required this.client});
  
  @override
  Future<List<CatModel>> getCats() async {
    try{
      await Future.delayed(const Duration(milliseconds: 1000));
      final cats = [
        const CatModel(
          id: 1
        )
      ];
      return cats;
    } on SocketException {
      throw NetworkFailure.exception;
    } on InvalidDataFailure{
      rethrow;
    }catch(e){
      throw UnknownFailure.exception;
    }
  }
}