import 'package:cat_breeds/core/error/failures.dart';
import 'package:cat_breeds/core/usecases/usecases.dart';
import 'package:cat_breeds/features/cats/domain/entities/cat_entity.dart';
import 'package:cat_breeds/features/cats/domain/repositories/cats_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatsUseCase implements UseCase<List<CatEntity>, GetCatsParams>{
  final CatsRepository catsRepository;

  GetCatsUseCase(this.catsRepository);

  @override
  Future<Either<Failure, List<CatEntity>>> call(GetCatsParams params) async {
    return await catsRepository.getCats(params);
  }

}

class GetCatsParams {
  final String category;

  GetCatsParams({
    required this.category
  });
}