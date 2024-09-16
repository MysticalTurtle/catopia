import 'package:catopia/data/model/cat_breed_model.dart';
import 'package:catopia/domain/entities/cat_breed_entity.dart';

class CatBreedMapper {
  static CatBreedEntity toEntity(CatBreedModel model) {
    return CatBreedEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      temperament: model.temperament,
      origin: model.origin,
      lifeSpan: model.lifeSpan,
      adaptability: model.adaptability,
      grooming: model.grooming,
      intelligence: model.intelligence,
      vocalisation: model.vocalisation,
      wikipediaUrl: model.wikipediaUrl,
      image: model.image.url,
      weight: model.weight.metric,
      indoor: model.indoor,
      lap: model.lap,
      experimental: model.experimental,
      hairless: model.hairless,
      natural: model.natural,
      rare: model.rare,
      rex: model.rex,
      hypoallergenic: model.hypoallergenic,      
    );
  }
}
