import 'package:cat_breeds/core/error/failures.dart';
import 'package:cat_breeds/core/usecases/usecases.dart';
import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/domain/repositories/cat_breeds_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatBreedsUseCase implements UseCase<List<CatBreedEntity>, GetCatBreedsParams>{
  final CatBreedsRepository catBreedsRepository;

  GetCatBreedsUseCase(this.catBreedsRepository);

  @override
  Future<Either<Failure, List<CatBreedEntity>>> call(GetCatBreedsParams params) async {
    return await catBreedsRepository.getCatBreeds(params);
  }

}

class GetCatBreedsParams {
  final int limit;
  final int page;

  GetCatBreedsParams({
    required this.limit,
    required this.page,
  });
}