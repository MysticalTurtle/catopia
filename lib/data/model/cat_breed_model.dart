class CatBreedModel {
  CatBreedModel({
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
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
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
    required this.image,
  });

  factory CatBreedModel.fromJson(Map<String, dynamic> json) => CatBreedModel(
        weight: Weight.fromJson(json['weight'] as Map<String, dynamic>),
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        cfaUrl: json['cfa_url'] as String? ?? '',
        vetstreetUrl: json['vetstreet_url'] as String? ?? '',
        vcahospitalsUrl: json['vcahospitals_url'] as String? ?? '',
        temperament: json['temperament'] as String? ?? '',
        origin: json['origin'] as String? ?? '',
        countryCodes: json['country_codes'] as String? ?? '',
        countryCode: json['country_code'] as String? ?? '',
        description: json['description'] as String? ?? '',
        lifeSpan: json['life_span'] as String? ?? '',
        indoor: json['indoor'] as int? ?? 0,
        lap: json['lap'] as int? ?? 0,
        altNames: json['alt_names'] as String? ?? '',
        adaptability: json['adaptability'] as int? ?? 0,
        affectionLevel: json['affection_level'] as int? ?? 0,
        childFriendly: json['child_friendly'] as int? ?? 0,
        dogFriendly: json['dog_friendly'] as int? ?? 0,
        energyLevel: json['energy_level'] as int? ?? 0,
        grooming: json['grooming'] as int? ?? 0,
        healthIssues: json['health_issues'] as int? ?? 0,
        intelligence: json['intelligence'] as int? ?? 0,
        sheddingLevel: json['shedding_level'] as int? ?? 0,
        socialNeeds: json['social_needs'] as int? ?? 0,
        strangerFriendly: json['stranger_friendly'] as int? ?? 0,
        vocalisation: json['vocalisation'] as int? ?? 0,
        experimental: json['experimental'] as int? ?? 0,
        hairless: json['hairless'] as int? ?? 0,
        natural: json['natural'] as int? ?? 0,
        rare: json['rare'] as int? ?? 0,
        rex: json['rex'] as int? ?? 0,
        suppressedTail: json['suppressed_tail'] as int? ?? 0,
        shortLegs: json['short_legs'] as int? ?? 0,
        wikipediaUrl: json['wikipedia_url'] as String? ?? '',
        hypoallergenic: json['hypoallergenic'] as int? ?? 0,
        referenceImageId: json['reference_image_id'] as String? ?? '',
        image: json['image'] != null
            ? Image.fromJson(json['image'] as Map<String, dynamic>)
            : const Image.empty(),
      );

  final Weight weight;
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
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
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
  final Image image;

  Map<String, dynamic> toJson() => {
        'weight': weight.toJson(),
        'id': id,
        'name': name,
        'cfa_url': cfaUrl,
        'vetstreet_url': vetstreetUrl,
        'vcahospitals_url': vcahospitalsUrl,
        'temperament': temperament,
        'origin': origin,
        'country_codes': countryCodes,
        'country_code': countryCode,
        'description': description,
        'life_span': lifeSpan,
        'indoor': indoor,
        'lap': lap,
        'alt_names': altNames,
        'adaptability': adaptability,
        'affection_level': affectionLevel,
        'child_friendly': childFriendly,
        'dog_friendly': dogFriendly,
        'energy_level': energyLevel,
        'grooming': grooming,
        'health_issues': healthIssues,
        'intelligence': intelligence,
        'shedding_level': sheddingLevel,
        'social_needs': socialNeeds,
        'stranger_friendly': strangerFriendly,
        'vocalisation': vocalisation,
        'experimental': experimental,
        'hairless': hairless,
        'natural': natural,
        'rare': rare,
        'rex': rex,
        'suppressed_tail': suppressedTail,
        'short_legs': shortLegs,
        'wikipedia_url': wikipediaUrl,
        'hypoallergenic': hypoallergenic,
        'reference_image_id': referenceImageId,
        'image': image.toJson(),
      };
}

class Image {
  const Image({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  // Image empry constructor
  const Image.empty()
      : id = '',
        width = 0,
        height = 0,
        url = '';

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'] as String? ?? '',
        width: json['width'] as int? ?? 0,
        height: json['height'] as int? ?? 0,
        url: json['url'] as String? ?? '',
      );

  final String id;
  final int width;
  final int height;
  final String url;

  Map<String, dynamic> toJson() => {
        'id': id,
        'width': width,
        'height': height,
        'url': url,
      };
}

class Weight {
  const Weight({
    required this.imperial,
    required this.metric,
  });

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json['imperial'] as String? ?? '',
        metric: json['metric'] as String? ?? '',
      );

  final String imperial;
  final String metric;

  Map<String, dynamic> toJson() => {
        'imperial': imperial,
        'metric': metric,
      };
}
