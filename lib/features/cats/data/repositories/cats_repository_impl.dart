import 'package:cat_breeds/core/error/failures.dart';
import 'package:cat_breeds/features/cats/data/datasources/remote/cats_remote_datasource.dart';
import 'package:cat_breeds/features/cats/domain/entities/cat_entity.dart';
import 'package:cat_breeds/features/cats/domain/repositories/cats_repository.dart';
import 'package:cat_breeds/features/cats/domain/usecases/get_cats_usecase.dart';
import 'package:dartz/dartz.dart';

class CatsRepositoryImpl implements CatsRepository{

  final CatsRemoteRepositoryDataSource catsRemoteRepositoryDataSource;

  CatsRepositoryImpl({
    required this.catsRemoteRepositoryDataSource,
  });

  @override
  Future<Either<Failure, List<CatEntity>>> getCats(GetCatsParams body) async{
    try{
      final response = await catsRemoteRepositoryDataSource.getCats();
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