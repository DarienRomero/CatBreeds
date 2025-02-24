import 'package:cat_breeds/features/cat_breed/data/models/cat_breed_model.dart';

abstract class CatBreedsRemoteRepositoryDataSource {
  Future<List<CatBreedModel>> getCatBreeds(int limit, int page, String searchText);
  Future<CatBreedModel> getCatBreed(String catBreedId);
}