import 'package:cat_breeds/features/cat_breed/domain/entities/cat_weight_entity.dart';

class CatWeightModel extends CatWeightEntity {
  const CatWeightModel({
    required super.imperial,
    required super.metric,
  });

  factory CatWeightModel.fromJson(Map<String, dynamic> json) {
    return CatWeightModel(
      imperial: json['imperial'] ?? "",
      metric: json['metric'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imperial': imperial,
      'metric': metric,
    };
  }
}