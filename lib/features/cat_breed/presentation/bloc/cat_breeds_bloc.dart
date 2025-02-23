import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/domain/usecases/get_cat_breeds_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_breeds_event.dart';
part 'cat_breeds_state.dart';

class CatBreedsBloc extends Bloc<CatBreedsEvent, CatBreedsState> {

  final GetCatBreedsUseCase getCatBreedsUseCase;

  CatBreedsBloc({
    required this.getCatBreedsUseCase,
  }) : super( const CatBreedsState(
    catBreedsList: [],
    catBreedsListError: false,
    catBreedsListLoading: false,
  ) ) {

    on<StartGetCatBreeds>((event, emit) async {
      emit(state.copyWith(
        catBreedsListLoading: true,
        catBreedsListError: false,
        catBreedsList: [],
      ));
      final failureOrData = await getCatBreedsUseCase(GetCatBreedsParams(
        limit: 10,
        page: 1,
        //TODO: Terminars
      ));
      failureOrData.fold(
        (failure) => emit(state.copyWith(
          catBreedsListLoading: false,
          catBreedsListError: true,
          catBreedsList: []
        )), 
        (data) => emit(state.copyWith(
          catBreedsListLoading: false,
          catBreedsListError: false,
          catBreedsList: data
        ))
      );
    });
  }
}