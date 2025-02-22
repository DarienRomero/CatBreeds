import 'package:equatable/equatable.dart';

class CatEntity extends Equatable{
  final int id;

  const CatEntity({
    required this.id,
  });

  CatEntity copyWith({
    int? id,
    String? category
  }) => CatEntity(
    id: id ?? this.id,
  );
  
  @override
  List<Object?> get props => [
    id,
  ];
}