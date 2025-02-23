import 'package:equatable/equatable.dart';

class CatWeightEntity extends Equatable{
  final String imperial;
  final String metric;

  const CatWeightEntity({
    required this.imperial,
    required this.metric,
  });

  @override
  List<Object?> get props => [imperial, metric];

  //Create copyWith
  CatWeightEntity copyWith({
    String? imperial,
    String? metric
  }) => CatWeightEntity(
    imperial: imperial ?? this.imperial,
    metric: metric ?? this.metric,
  );

  static CatWeightEntity get empty => const CatWeightEntity(
    imperial: '',
    metric: '',
  );

}