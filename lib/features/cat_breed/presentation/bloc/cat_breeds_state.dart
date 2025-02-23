part of 'cat_breeds_bloc.dart';

@immutable
class CatBreedsState {
  final bool catBreedsListLoading;
  final bool catBreedsListError;
  final List<CatBreedEntity> catBreedsList;

  const CatBreedsState({
    required this.catBreedsListLoading,
    required this.catBreedsListError,
    required this.catBreedsList,
  });

  CatBreedsState copyWith({
    bool? catBreedsListLoading,
    bool? catBreedsListError,
    List<CatBreedEntity>? catBreedsList,
  }) => CatBreedsState(
    catBreedsListLoading: catBreedsListLoading ?? this.catBreedsListLoading,
    catBreedsListError: catBreedsListError ?? this.catBreedsListError,
    catBreedsList: catBreedsList ?? this.catBreedsList,
  );
}