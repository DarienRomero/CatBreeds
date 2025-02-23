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
    catBreedsListPage: 1,
    catBreedsLimitReached: false,
    catBreedListLoading: false,
    catBreedListError: false,
    catBreedList: CatBreedEntity.empty,
  ) ) {
    on<StartGetCatBreeds>((event, emit) async {
      if(event.reset){
        emit(state.copyWith(
          catBreedsListPage: 1,
          catBreedsListLoading: false,
          catBreedsListError: false,
          catBreedsList: [],
          catBreedsLimitReached: false
        ));
        return;
      }
      if(state.catBreedsListLoading) return;
      if(state.catBreedsLimitReached) return;
      emit(state.copyWith(
        catBreedsListLoading: true,
        catBreedsListError: false,
        catBreedsList: [],
      ));
      final failureOrData = await getCatBreedsUseCase(GetCatBreedsParams(
        limit: limit,
        page: state.catBreedsListPage,
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
        catBreedListLoading: true,
        catBreedListError: false,
        catBreedList: CatBreedEntity.empty
      ));
      final failureOrData = await getCatBreedUseCase(GetCatBreedParams(
        catBreedId: event.catBreedId,
      ));
      failureOrData.fold(
        (failure) => emit(state.copyWith(
          catBreedListLoading: false,
          catBreedListError: true,
          catBreedList: CatBreedEntity.empty
        )), 
        (data) => emit(state.copyWith(
          catBreedListLoading: false,
          catBreedListError: false,
          catBreedList: data
        ))
      );
    });
  }
}