part of 'cat_breeds_bloc.dart';
@immutable
abstract class CatBreedsEvent {
  
}
class StartGetCatBreeds extends CatBreedsEvent {
  final bool reset;
  final String? searchText;
  StartGetCatBreeds({
    this.reset = false,
    this.searchText
  });
}

class StartGetCatBreed extends CatBreedsEvent {
  final String catBreedId;
  StartGetCatBreed({
    required this.catBreedId
  });
}