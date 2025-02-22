part of 'cats_bloc.dart';

@immutable
class CatsState {
  final bool catsListLoading;
  final bool catsListError;
  final List<CatEntity> catsList;

  const CatsState({
    required this.catsListLoading,
    required this.catsListError,
    required this.catsList,
  });

  CatsState copyWith({
    bool? catsListLoading,
    bool? catsListError,
    List<CatEntity>? catsList,
  }) => CatsState(
    catsListLoading: catsListLoading ?? this.catsListLoading,
    catsListError: catsListError ?? this.catsListError,
    catsList: catsList ?? this.catsList,
  );
}