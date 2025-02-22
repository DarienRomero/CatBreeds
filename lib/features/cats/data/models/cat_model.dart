import 'package:cat_breeds/features/cats/domain/entities/cat_entity.dart';

class CatModel extends CatEntity{

  const CatModel({
    required super.id,
  });

  factory CatModel.fromMap(Map<String, dynamic> json) => CatModel(
    id: json["id"] ?? -1,
  );
}