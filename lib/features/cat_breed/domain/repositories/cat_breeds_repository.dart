import 'package:cat_breeds/core/error/failures.dart';
import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/domain/usecases/get_cat_breeds_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class CatBreedsRepository{
  Future<Either<Failure, List<CatBreedEntity>>> getCatBreeds(GetCatBreedsParams body);
}