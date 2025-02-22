import 'package:cat_breeds/core/error/failures.dart';
import 'package:cat_breeds/features/cats/domain/entities/cat_entity.dart';
import 'package:cat_breeds/features/cats/domain/usecases/get_cats_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class CatsRepository{
  Future<Either<Failure, List<CatEntity>>> getCats(GetCatsParams body);
}