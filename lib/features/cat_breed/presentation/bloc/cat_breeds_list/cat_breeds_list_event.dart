part of 'cat_breeds_list_bloc.dart';
@immutable
abstract class CatBreedsListEvent {
  
}
class StartGetCatBreeds extends CatBreedsListEvent {
  final bool reset;
  final String? searchText;
  StartGetCatBreeds({
    this.reset = false,
    this.searchText
  });
}

class StartGetCatBreed extends CatBreedsListEvent {
  final String catBreedId;
  StartGetCatBreed({
    required this.catBreedId
  });
}