import 'package:meta/meta.dart';

@immutable
abstract class CatBreedUpdateEvent {}

class LoadCatBreed extends CatBreedUpdateEvent {}

class UpdateCatBreed extends CatBreedUpdateEvent {
  final CatBreedEntity catBreed;

  UpdateCatBreed(this.catBreed);
}
