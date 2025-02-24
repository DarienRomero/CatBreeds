part of 'cat_breeds_list_bloc.dart';

@immutable
class CatBreedsListState {
  final bool catBreedsListLoading;
  final bool catBreedsListError;
  final List<CatBreedEntity> catBreedsList;
  final int catBreedsListPage;
  final bool catBreedsLimitReached;
  final String catBreedsSearchText;

  const CatBreedsListState({
    required this.catBreedsListLoading,
    required this.catBreedsListError,
    required this.catBreedsList,
    required this.catBreedsListPage,
    required this.catBreedsLimitReached,
    required this.catBreedsSearchText,
  });

  CatBreedsListState copyWith({
    bool? catBreedsListLoading,
    bool? catBreedsListError,
    List<CatBreedEntity>? catBreedsList,
    int? catBreedsListPage,
    bool? catBreedsLimitReached,
    String? catBreedsSearchText,
  }) => CatBreedsListState(
    catBreedsListLoading: catBreedsListLoading ?? this.catBreedsListLoading,
    catBreedsListError: catBreedsListError ?? this.catBreedsListError,
    catBreedsList: catBreedsList ?? this.catBreedsList,
    catBreedsListPage: catBreedsListPage ?? this.catBreedsListPage,
    catBreedsLimitReached: catBreedsLimitReached ?? this.catBreedsLimitReached,
    catBreedsSearchText: catBreedsSearchText ?? this.catBreedsSearchText,
  );
}