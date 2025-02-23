import 'package:cat_breeds/features/cat_breed/domain/entities/cat_weight_entity.dart';
import 'package:equatable/equatable.dart';

class CatBreedEntity extends Equatable{
    final CatWeightEntity weight;
    final String id;
    final String name;
    final String cfaUrl;
    final String vetstreetUrl;
    final String vcahospitalsUrl;
    final String temperament;
    final String origin;
    final String countryCodes;
    final String countryCode;
    final String description;
    final String lifeSpan;
    final int indoor;
    final int lap;
    final int adaptability;
    final int affectionLevel;
    final int childFriendly;
    final int catFriendly;
    final int dogFriendly;
    final int energyLevel;
    final int grooming;
    final int healthIssues;
    final int intelligence;
    final int sheddingLevel;
    final int socialNeeds;
    final int strangerFriendly;
    final int vocalisation;
    final int bidability;
    final int experimental;
    final int hairless;
    final int natural;
    final int rare;
    final int rex;
    final int suppressedTail;
    final int shortLegs;
    final String wikipediaUrl;
    final int hypoallergenic;
    final String referenceImageId;
    final String altNames;

  const CatBreedEntity({
    required this.weight,
    required this.id,
    required this.name,
    required this.cfaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.catFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.bidability,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
    required this.altNames,
  });

  //Create copyWith
  CatBreedEntity copyWith({
    CatWeightEntity? weight,
    String? id,
    String? name,
    String? cfaUrl,
    String? vetstreetUrl,
    String? vcahospitalsUrl,
    String? temperament,
    String? origin,
    String? countryCodes,
    String? countryCode,
    String? description,
    String? lifeSpan,
    int? indoor,
    int? lap,
    int? adaptability,
    int? affectionLevel,
    int? childFriendly,
    int? catFriendly,
    int? dogFriendly,
    int? energyLevel,
    int? grooming,
    int? healthIssues,
    int? intelligence,
    int? sheddingLevel,
    int? socialNeeds,
    int? strangerFriendly,
    int? vocalisation,
    int? bidability,
    int? experimental,
    int? hairless,
    int? natural,
    int? rare,
    int? rex,
    int? suppressedTail,
    int? shortLegs,
    String? wikipediaUrl,
    int? hypoallergenic,
    String? referenceImageId,
    String? altNames,
  }) => CatBreedEntity(
    weight: weight ?? this.weight,
    id: id ?? this.id,
    name: name ?? this.name,
    cfaUrl: cfaUrl ?? this.cfaUrl,
    vetstreetUrl: vetstreetUrl ?? this.vetstreetUrl,
    vcahospitalsUrl: vcahospitalsUrl ?? this.vcahospitalsUrl,
    temperament: temperament ?? this.temperament,
    origin: origin ?? this.origin,
    countryCodes: countryCodes ?? this.countryCodes,
    countryCode: countryCode ?? this.countryCode,
    description: description ?? this.description,
    lifeSpan: lifeSpan ?? this.lifeSpan,
    indoor: indoor ?? this.indoor,
    lap: lap ?? this.lap,
    adaptability: adaptability ?? this.adaptability,
    affectionLevel: affectionLevel ?? this.affectionLevel,
    childFriendly: childFriendly ?? this.childFriendly,
    catFriendly: catFriendly ?? this.catFriendly,
    dogFriendly: dogFriendly ?? this.dogFriendly,
    energyLevel: energyLevel ?? this.energyLevel,
    grooming: grooming ?? this.grooming,
    healthIssues: healthIssues ?? this.healthIssues,
    intelligence: intelligence ?? this.intelligence,
    sheddingLevel: sheddingLevel ?? this.sheddingLevel,
    socialNeeds: socialNeeds ?? this.socialNeeds,
    strangerFriendly: strangerFriendly ?? this.strangerFriendly,
    vocalisation: vocalisation ?? this.vocalisation,
    bidability: bidability ?? this.bidability,
    experimental: experimental ?? this.experimental,
    hairless: hairless ?? this.hairless,
    natural: natural ?? this.natural,
    rare: rare ?? this.rare,
    rex: rex ?? this.rex,
    suppressedTail: suppressedTail ?? this.suppressedTail,
    shortLegs: shortLegs ?? this.shortLegs,
    wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
    hypoallergenic: hypoallergenic ?? this.hypoallergenic,
    referenceImageId: referenceImageId ?? this.referenceImageId,
    altNames: altNames ?? this.altNames,
  );
  
  @override
  List<Object?> get props => [
    weight,
    id,
    name,
    cfaUrl,
    vetstreetUrl,
    vcahospitalsUrl,
    temperament,
    origin,
    countryCodes,
    countryCode,
    description,
    lifeSpan,
    indoor,
    lap,
    adaptability,
    affectionLevel,
    childFriendly,
    catFriendly,
    dogFriendly,
    energyLevel,
    grooming,
    healthIssues,
    intelligence,
    sheddingLevel,
    socialNeeds,
    strangerFriendly,
    vocalisation,
    bidability,
    experimental,
    hairless,
    natural,
    rare,
    rex,
    suppressedTail,
    shortLegs,
    wikipediaUrl,
    hypoallergenic,
    referenceImageId,
    altNames,
  ];

  bool get isEmpty => id == '';

  String get imageUrl => "https://cdn2.thecatapi.com/images/$referenceImageId.jpg";

  //Create empty static getter
  static CatBreedEntity get empty => CatBreedEntity(
    weight: CatWeightEntity.empty,
    id: '',
    name: '',
    cfaUrl: '',
    vetstreetUrl: '',
    vcahospitalsUrl: '',
    temperament: '',
    origin: '',
    countryCodes: '',
    countryCode: '',
    description: '',
    lifeSpan: '',
    indoor: 0,
    lap: 0,
    adaptability: 0,
    affectionLevel: 0,
    childFriendly: 0,
    catFriendly: 0,
    dogFriendly: 0,
    energyLevel: 0,
    grooming: 0,
    healthIssues: 0,
    intelligence: 0,
    sheddingLevel: 0,
    socialNeeds: 0,
    strangerFriendly: 0,
    vocalisation: 0,
    bidability: 0,
    experimental: 0,
    hairless: 0,
    natural: 0,
    rare: 0,
    rex: 0,
    suppressedTail: 0,
    shortLegs: 0,
    wikipediaUrl: '',
    hypoallergenic: 0,
    referenceImageId: '',
    altNames: '',
  );
}