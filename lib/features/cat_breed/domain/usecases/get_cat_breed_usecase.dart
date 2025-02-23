import 'package:cat_breeds/core/error/failures.dart';
import 'package:cat_breeds/core/usecases/usecases.dart';
import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/domain/repositories/cat_breeds_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatBreedUseCase implements UseCase<CatBreedEntity, GetCatBreedParams>{
  final CatBreedsRepository catBreedsRepository;

  GetCatBreedUseCase(this.catBreedsRepository);

  @override
  Future<Either<Failure, CatBreedEntity>> call(GetCatBreedParams params) async {
    return await catBreedsRepository.getCatBreed(params);
  }

}

class GetCatBreedParams {
  final int catBreedId;

  GetCatBreedParams({
    required this.catBreedId,
  });
}