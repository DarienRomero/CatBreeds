part of 'cat_breed_detail_bloc.dart';
@immutable
abstract class CatBreedDetailEvent {
  
}
class StartGetCatBreeds extends CatBreedDetailEvent {
  final bool reset;
  final String? searchText;
  StartGetCatBreeds({
    this.reset = false,
    this.searchText
  });
}

class StartGetCatBreed extends CatBreedDetailEvent {
  final String catBreedId;
  StartGetCatBreed({
    required this.catBreedId
  });
}