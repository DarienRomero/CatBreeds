import 'package:cat_breeds/core/constants.dart';
import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/domain/usecases/get_cat_breeds_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_breeds_list_event.dart';
part 'cat_breeds_list_state.dart';

class CatBreedsListBloc extends Bloc<CatBreedsListEvent, CatBreedsListState> {

  final GetCatBreedsUseCase getCatBreedsUseCase;

  CatBreedsListBloc({
    required this.getCatBreedsUseCase,
  }) : super( const CatBreedsListState(
    catBreedsList: [],
    catBreedsListError: false,
    catBreedsListLoading: false,
    catBreedsListPage: defaultFirstPage,
    catBreedsLimitReached: false,
    catBreedsSearchText: "",
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
  }
}