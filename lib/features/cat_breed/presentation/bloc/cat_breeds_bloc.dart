import 'package:cat_breeds/core/constants.dart';
import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/domain/usecases/get_cat_breed_usecase.dart';
import 'package:cat_breeds/features/cat_breed/domain/usecases/get_cat_breeds_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_breeds_event.dart';
part 'cat_breeds_state.dart';

class CatBreedsBloc extends Bloc<CatBreedsEvent, CatBreedsState> {

  final GetCatBreedsUseCase getCatBreedsUseCase;
  final GetCatBreedUseCase getCatBreedUseCase;

  CatBreedsBloc({
    required this.getCatBreedsUseCase,
    required this.getCatBreedUseCase,
  }) : super( CatBreedsState(
    catBreedsList: const [],
    catBreedsListError: false,
    catBreedsListLoading: false,
    catBreedsListPage: defaultFirstPage,
    catBreedsLimitReached: false,
    catBreedsSearchText: "",
    catBreedLoading: false,
    catBreedError: false,
    catBreed: CatBreedEntity.empty,
  ) ) {
    on<StartGetCatBreeds>((event, emit) async {
      if(event.reset){
        emit(state.copyWith(
          catBreedsListPage: defaultFirstPage,
          catBreedsListLoading: false,
          catBreedsListError: false,
          catBreedsList: [],
          catBreedsSearchText: "",
          catBreedsLimitReached: false
        ));
      }
      if(state.catBreedsListLoading) return;
      if(state.catBreedsLimitReached) return;
      emit(state.copyWith(
        catBreedsListLoading: true,
        catBreedsListError: false,
        catBreedsSearchText: event.searchText ?? state.catBreedsSearchText
      ));
      final failureOrData = await getCatBreedsUseCase(GetCatBreedsParams(
        limit: limit,
        page: state.catBreedsListPage,
        searchText: state.catBreedsSearchText
      ));
      failureOrData.fold(
        (failure) => emit(state.copyWith(
          catBreedsListLoading: false,
          catBreedsListError: true,
          catBreedsList: []
        )), 
        (data) {
          emit(state.copyWith(
            catBreedsListLoading: false,
            catBreedsListError: false,
            catBreedsList: [...state.catBreedsList, ...data],
            catBreedsListPage: state.catBreedsListPage + 1,
            catBreedsLimitReached: data.length < limit
          ));
        }
      );
    });

    on<StartGetCatBreed>((event, emit) async {
      emit(state.copyWith(
        catBreedLoading: true,
        catBreedError: false,
        catBreed: CatBreedEntity.empty
      ));
      final failureOrData = await getCatBreedUseCase(GetCatBreedParams(
        catBreedId: event.catBreedId,
      ));
      failureOrData.fold(
        (failure) => emit(state.copyWith(
          catBreedLoading: false,
          catBreedError: true,
          catBreed: CatBreedEntity.empty
        )), 
        (data) => emit(state.copyWith(
          catBreedLoading: false,
          catBreedError: false,
          catBreed: data
        ))
      );
    });
  }
}