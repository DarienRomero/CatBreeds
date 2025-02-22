import 'package:cat_breeds/features/cats/data/models/cat_model.dart';

abstract class CatsRemoteRepositoryDataSource {
  Future<List<CatModel>> getCats();
}