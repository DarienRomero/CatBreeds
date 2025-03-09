import 'package:meta/meta.dart';
import 'cat_breed_entity.dart';

@immutable
class CatBreedUpdateState {
  final bool catBreedLoading;
  final bool catBreedError;
  final CatBreedEntity catBreed;

  const CatBreedUpdateState({
    required this.catBreedLoading,
    required this.catBreedError,
    required this.catBreed,
  });

  factory CatBreedUpdateState.initial() {
    return CatBreedUpdateState(
      catBreedLoading: false,
      catBreedError: false,
      catBreed: CatBreedEntity.initial(),
    );
  }

  CatBreedUpdateState copyWith({
    bool? catBreedLoading,
    bool? catBreedError,
    CatBreedEntity? catBreed,
  }) {
    return CatBreedUpdateState(
      catBreedLoading: catBreedLoading ?? this.catBreedLoading,
      catBreedError: catBreedError ?? this.catBreedError,
      catBreed: catBreed ?? this.catBreed,
    );
  }
}
