import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'cat_breed_update_state.dart';
import 'cat_breed_update_event.dart';

class CatBreedUpdateBloc extends Bloc<CatBreedUpdateEvent, CatBreedUpdateState> {
  CatBreedUpdateBloc() : super(CatBreedUpdateState.initial());

  @override
  Stream<CatBreedUpdateState> mapEventToState(CatBreedUpdateEvent event) async* {
    // Handle events and update state
  }
}
