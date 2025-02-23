import 'package:cat_breeds/core/error/failures.dart';
import 'package:cat_breeds/features/cat_breed/data/datasources/remote/cat_breeds_remote_datasource.dart';
import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/domain/repositories/cat_breeds_repository.dart';
import 'package:cat_breeds/features/cat_breed/domain/usecases/get_cat_breeds_usecase.dart';
import 'package:dartz/dartz.dart';

class CatBreedsRepositoryImpl implements CatBreedsRepository{

  final CatBreedsRemoteRepositoryDataSource catBreedsRemoteRepositoryDataSource;

  CatBreedsRepositoryImpl({
    required this.catBreedsRemoteRepositoryDataSource,
  });

  @override
  Future<Either<Failure, List<CatBreedEntity>>> getCatBreeds(GetCatBreedsParams body) async{
    try{
      final response = await catBreedsRemoteRepositoryDataSource.getCatBreeds(body.limit, body.page);
      return Right(response);
    }on NetworkFailure catch(e){
      return Left(e);
    }on UnknownFailure catch(e){
      return Left(e);
    }catch(_){
      return Left(UnknownFailure.exception);
    }
  }
}