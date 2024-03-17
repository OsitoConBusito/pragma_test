import 'package:equatable/equatable.dart';

import 'dart:convert';

import 'package:pragma_test/features/list/domain/entities/weight.dart';

List<CatBreed> catBreedFromJson(String str) =>
    List<CatBreed>.from(json.decode(str).map((x) => CatBreed.fromJson(x)));

String catBreedToJson(List<CatBreed> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatBreed extends Equatable {
  final Weight? weight;
  final String? id;
  final String? name;
  final String? cfaUrl;
  final String? vetstreetUrl;
  final String? vcahospitalsUrl;
  final String? temperament;
  final String? origin;
  final String? countryCodes;
  final String? countryCode;
  final String? description;
  final String? lifeSpan;
  final int? indoor;
  final int? lap;
  final String? altNames;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  final int? suppressedTail;
  final int? shortLegs;
  final String? wikipediaUrl;
  final int? hypoallergenic;
  final String? referenceImageId;
  final int? catFriendly;
  final int? bidability;

  const CatBreed({
    this.adaptability,
    this.affectionLevel,
    this.altNames,
    this.bidability,
    this.catFriendly,
    this.cfaUrl,
    this.childFriendly,
    this.countryCode,
    this.countryCodes,
    this.description,
    this.dogFriendly,
    this.energyLevel,
    this.experimental,
    this.grooming,
    this.hairless,
    this.healthIssues,
    this.hypoallergenic,
    this.id,
    this.indoor,
    this.intelligence,
    this.lap,
    this.lifeSpan,
    this.name,
    this.natural,
    this.origin,
    this.rare,
    this.referenceImageId,
    this.rex,
    this.sheddingLevel,
    this.shortLegs,
    this.socialNeeds,
    this.strangerFriendly,
    this.suppressedTail,
    this.temperament,
    this.vcahospitalsUrl,
    this.vetstreetUrl,
    this.vocalisation,
    this.weight,
    this.wikipediaUrl,
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) => CatBreed(
        adaptability: json["adaptability"],
        affectionLevel: json["affection_level"],
        altNames: json["alt_names"],
        bidability: json["bidability"],
        catFriendly: json["cat_friendly"],
        cfaUrl: json["cfa_url"],
        childFriendly: json["child_friendly"],
        countryCode: json["country_code"],
        countryCodes: json["country_codes"],
        description: json["description"],
        dogFriendly: json["dog_friendly"],
        energyLevel: json["energy_level"],
        experimental: json["experimental"],
        grooming: json["grooming"],
        hairless: json["hairless"],
        healthIssues: json["health_issues"],
        hypoallergenic: json["hypoallergenic"],
        id: json["id"],
        indoor: json["indoor"],
        intelligence: json["intelligence"],
        lap: json["lap"],
        lifeSpan: json["life_span"],
        name: json["name"],
        natural: json["natural"],
        origin: json["origin"],
        rare: json["rare"],
        referenceImageId: json["reference_image_id"],
        rex: json["rex"],
        sheddingLevel: json["shedding_level"],
        shortLegs: json["short_legs"],
        socialNeeds: json["social_needs"],
        strangerFriendly: json["stranger_friendly"],
        suppressedTail: json["suppressed_tail"],
        temperament: json["temperament"],
        vcahospitalsUrl: json["vcahospitals_url"],
        vetstreetUrl: json["vetstreet_url"],
        vocalisation: json["vocalisation"],
        weight: Weight.fromJson(json["weight"]),
        wikipediaUrl: json["wikipedia_url"],
      );

  Map<String, dynamic> toJson() => {
        "adaptability": adaptability,
        "affection_level": affectionLevel,
        "alt_names": altNames,
        "bidability": bidability,
        "cat_friendly": catFriendly,
        "cfa_url": cfaUrl,
        "child_friendly": childFriendly,
        "country_code": countryCode,
        "country_codes": countryCodes,
        "description": description,
        "dog_friendly": dogFriendly,
        "energy_level": energyLevel,
        "experimental": experimental,
        "grooming": grooming,
        "hairless": hairless,
        "health_issues": healthIssues,
        "hypoallergenic": hypoallergenic,
        "id": id,
        "indoor": indoor,
        "intelligence": intelligence,
        "lap": lap,
        "life_span": lifeSpan,
        "name": name,
        "natural": natural,
        "origin": origin,
        "rare": rare,
        "reference_image_id": referenceImageId,
        "rex": rex,
        "shedding_level": sheddingLevel,
        "short_legs": shortLegs,
        "social_needs": socialNeeds,
        "stranger_friendly": strangerFriendly,
        "suppressed_tail": suppressedTail,
        "temperament": temperament,
        "vcahospitals_url": vcahospitalsUrl,
        "vetstreet_url": vetstreetUrl,
        "vocalisation": vocalisation,
        "weight": weight?.toJson(),
        "wikipedia_url": wikipediaUrl,
      };

  @override
  List<Object?> get props => [
        adaptability,
        affectionLevel,
        altNames,
        bidability,
        catFriendly,
        cfaUrl,
        childFriendly,
        countryCode,
        countryCodes,
        description,
        dogFriendly,
        energyLevel,
        experimental,
        grooming,
        hairless,
        healthIssues,
        hypoallergenic,
        id,
        indoor,
        intelligence,
        lap,
        lifeSpan,
        name,
        natural,
        origin,
        rare,
        referenceImageId,
        rex,
        sheddingLevel,
        shortLegs,
        socialNeeds,
        strangerFriendly,
        suppressedTail,
        temperament,
        vcahospitalsUrl,
        vetstreetUrl,
        vocalisation,
        weight,
        wikipediaUrl,
      ];
}
