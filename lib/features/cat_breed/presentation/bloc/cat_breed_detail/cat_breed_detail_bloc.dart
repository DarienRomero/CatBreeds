import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/domain/usecases/get_cat_breed_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_breed_detail_event.dart';
part 'cat_breed_detail_state.dart';

class CatBreedDetailBloc extends Bloc<CatBreedDetailEvent, CatBreedDetailState> {

  final GetCatBreedUseCase getCatBreedUseCase;

  CatBreedDetailBloc({
    required this.getCatBreedUseCase,
  }) : super( CatBreedDetailState(
    catBreedLoading: false,
    catBreedError: false,
    catBreed: CatBreedEntity.empty,
  ) ) {

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