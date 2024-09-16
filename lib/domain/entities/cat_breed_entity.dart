import 'package:equatable/equatable.dart';

class CatBreedEntity extends Equatable {
  const CatBreedEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.weight,
    required this.temperament,
    required this.origin,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.adaptability,
    required this.grooming,
    required this.intelligence,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.wikipediaUrl,
    required this.hypoallergenic,
  });

  final String id;
  final String name;
  final String description;
  final String image;
  final String weight;
  final String temperament;
  final String origin;
  final String lifeSpan;
  final int indoor;
  final int lap;
  final int adaptability;
  final int grooming;
  final int intelligence;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final String wikipediaUrl;
  final int hypoallergenic;

  @override
  List<Object> get props => [
        id,
        name,
        description,
        image,
        weight,
        temperament,
        origin,
        lifeSpan,
        indoor,
        lap,
        adaptability,
        grooming,
        intelligence,
        vocalisation,
        experimental,
        hairless,
        natural,
        rare,
        rex,
        wikipediaUrl,
        hypoallergenic,
      ];
}
