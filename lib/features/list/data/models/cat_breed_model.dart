import 'package:pragma_test/features/list/domain/entities/cat_breed.dart';
import 'package:pragma_test/features/list/domain/entities/weight.dart';

class CatBreedModel extends CatBreed {
  const CatBreedModel({
    required super.adaptability,
    required super.affectionLevel,
    super.altNames,
    required super.bidability,
    required super.catFriendly,
    super.cfaUrl,
    required super.childFriendly,
    required super.countryCode,
    required super.countryCodes,
    required super.description,
    required super.dogFriendly,
    required super.energyLevel,
    required super.experimental,
    required super.grooming,
    required super.hairless,
    required super.healthIssues,
    required super.hypoallergenic,
    required super.id,
    required super.indoor,
    required super.intelligence,
    super.lap,
    required super.lifeSpan,
    required super.name,
    required super.natural,
    required super.origin,
    required super.rare,
    super.referenceImageId,
    required super.rex,
    required super.sheddingLevel,
    required super.shortLegs,
    required super.socialNeeds,
    required super.strangerFriendly,
    required super.suppressedTail,
    required super.temperament,
    super.vcahospitalsUrl,
    super.vetstreetUrl,
    required super.vocalisation,
    required super.weight,
    super.wikipediaUrl,
  });

  factory CatBreedModel.fromJson(Map<String, dynamic> json) => CatBreedModel(
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

  static List<CatBreedModel>? fromList(dynamic list) {
    var result = <CatBreedModel>[];
    if (list != null) {
      result = [];
      for (dynamic json in list) {
        final catBreed = CatBreedModel.fromJson(json);

        result.add(catBreed);
      }
    }
    return result;
  }
}
