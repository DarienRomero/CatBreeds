import 'package:cat_breeds/features/cats/domain/entities/cat_entity.dart';
import 'package:cat_breeds/features/cats/domain/usecases/get_cats_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class ActivitiesBloc extends Bloc<CatsEvent, CatsState> {

  final GetCatsUseCase getCatsUseCase;

  ActivitiesBloc({
    required this.getCatsUseCase,
  }) : super( const CatsState(
    catsList: [],
    catsListError: false,
    catsListLoading: false,
  ) ) {

    on<StartGetCats>((event, emit) async {
      emit(state.copyWith(
        catsListLoading: true,
        catsListError: false,
        catsList: [],
      ));
      final failureOrData = await getCatsUseCase(GetCatsParams(
        category: ''
      ));
      failureOrData.fold(
        (failure) => emit(state.copyWith(
          catsListLoading: false,
          catsListError: true,
          catsList: []
        )), 
        (data) => emit(state.copyWith(
          catsListLoading: false,
          catsListError: false,
          catsList: data
        ))
      );
    });
  }
}