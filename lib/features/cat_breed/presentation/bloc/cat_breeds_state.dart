part of 'cat_breeds_bloc.dart';

@immutable
class CatBreedsState {
  final bool catBreedsListLoading;
  final bool catBreedsListError;
  final List<CatBreedEntity> catBreedsList;
  final int catBreedsListPage;
  final bool catBreedsLimitReached;
  final String catBreedsSearchText;

  final bool catBreedLoading;
  final bool catBreedError;
  final CatBreedEntity catBreed;

  const CatBreedsState({
    required this.catBreedsListLoading,
    required this.catBreedsListError,
    required this.catBreedsList,
    required this.catBreedsListPage,
    required this.catBreedsLimitReached,
    required this.catBreedsSearchText,
    required this.catBreedLoading,
    required this.catBreedError,
    required this.catBreed,
  });

  CatBreedsState copyWith({
    bool? catBreedsListLoading,
    bool? catBreedsListError,
    List<CatBreedEntity>? catBreedsList,
    int? catBreedsListPage,
    bool? catBreedsLimitReached,
    String? catBreedsSearchText,
    bool? catBreedLoading,
    bool? catBreedError,
    CatBreedEntity? catBreed,
  }) => CatBreedsState(
    catBreedsListLoading: catBreedsListLoading ?? this.catBreedsListLoading,
    catBreedsListError: catBreedsListError ?? this.catBreedsListError,
    catBreedsList: catBreedsList ?? this.catBreedsList,
    catBreedsListPage: catBreedsListPage ?? this.catBreedsListPage,
    catBreedsLimitReached: catBreedsLimitReached ?? this.catBreedsLimitReached,
    catBreedsSearchText: catBreedsSearchText ?? this.catBreedsSearchText,
    catBreedLoading: catBreedLoading ?? this.catBreedLoading,
    catBreedError: catBreedError ?? this.catBreedError,
    catBreed: catBreed ?? this.catBreed,
  );
}