part of 'cat_breed_detail_bloc.dart';

@immutable
class CatBreedDetailState {

  final bool catBreedLoading;
  final bool catBreedError;
  final CatBreedEntity catBreed;

  const CatBreedDetailState({
    required this.catBreedLoading,
    required this.catBreedError,
    required this.catBreed,
  });

  CatBreedDetailState copyWith({
    bool? catBreedLoading,
    bool? catBreedError,
    CatBreedEntity? catBreed,
  }) => CatBreedDetailState(
    catBreedLoading: catBreedLoading ?? this.catBreedLoading,
    catBreedError: catBreedError ?? this.catBreedError,
    catBreed: catBreed ?? this.catBreed,
  );
}