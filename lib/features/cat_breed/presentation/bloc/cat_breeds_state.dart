part of 'cat_breeds_bloc.dart';

@immutable
class CatBreedsState {
  final bool catBreedsListLoading;
  final bool catBreedsListError;
  final List<CatBreedEntity> catBreedsList;
  final int catBreedsListPage;
  final bool catBreedsLimitReached;

  final bool catBreedListLoading;
  final bool catBreedListError;
  final CatBreedEntity catBreedList;

  const CatBreedsState({
    required this.catBreedsListLoading,
    required this.catBreedsListError,
    required this.catBreedsList,
    required this.catBreedsListPage,
    required this.catBreedsLimitReached,
    required this.catBreedListLoading,
    required this.catBreedListError,
    required this.catBreedList,
  });

  CatBreedsState copyWith({
    bool? catBreedsListLoading,
    bool? catBreedsListError,
    List<CatBreedEntity>? catBreedsList,
    int? catBreedsListPage,
    bool? catBreedsLimitReached,
    bool? catBreedListLoading,
    bool? catBreedListError,
    CatBreedEntity? catBreedList,
  }) => CatBreedsState(
    catBreedsListLoading: catBreedsListLoading ?? this.catBreedsListLoading,
    catBreedsListError: catBreedsListError ?? this.catBreedsListError,
    catBreedsList: catBreedsList ?? this.catBreedsList,
    catBreedsListPage: catBreedsListPage ?? this.catBreedsListPage,
    catBreedsLimitReached: catBreedsLimitReached ?? this.catBreedsLimitReached,
    catBreedListLoading: catBreedListLoading ?? this.catBreedListLoading,
    catBreedListError: catBreedListError ?? this.catBreedListError,
    catBreedList: catBreedList ?? this.catBreedList,
  );
}