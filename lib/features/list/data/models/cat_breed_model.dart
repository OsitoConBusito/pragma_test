import 'package:pragma_test/features/list/domain/entities/cat_breed.dart';

class CatBreedModel extends CatBreed {
  const CatBreedModel({
    required super.adaptability,
    required super.affectionLevel,
    required super.altNames,
    required super.bidability,
    required super.catFriendly,
    required super.cfaUrl,
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
    required super.lap,
    required super.lifeSpan,
    required super.name,
    required super.natural,
    required super.origin,
    required super.rare,
    required super.referenceImageId,
    required super.rex,
    required super.sheddingLevel,
    required super.shortLegs,
    required super.socialNeeds,
    required super.strangerFriendly,
    required super.suppressedTail,
    required super.temperament,
    required super.vcahospitalsUrl,
    required super.vetstreetUrl,
    required super.vocalisation,
    required super.weight,
    required super.wikipediaUrl,
  });

  static List<CatBreedModel>? fromList(dynamic list) {
    var result = <CatBreedModel>[];
    if (list != null) {
      result = [];
      for (dynamic json in list) {
        final catBreed = CatBreed.fromJson(json);

        result.add(catBreed as CatBreedModel);
      }
    }
    return result;
  }
}
