part of 'cat_breeds_bloc.dart';
@immutable
abstract class CatBreedsEvent {
  
}
class StartGetCatBreeds extends CatBreedsEvent {
  final bool reset;
  StartGetCatBreeds({
    this.reset = false
  });
}

class StartGetCatBreed extends CatBreedsEvent {
  final int catBreedId;
  StartGetCatBreed({
    required this.catBreedId
  });
}