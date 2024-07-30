// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:user_api/src/models/models.dart';

part 'cat.g.dart';

/// {@template cat}
/// Modelo de datos para un gato
/// {@endtemplate}
class Cat extends Equatable {
  /// {@macro company}
  const Cat({
    required this.weight,
    required this.id,
    required this.name,
    required this.cfa_url,
    required this.vetstreet_url,
    required this.vcahospitals_url,
    required this.temperament,
    required this.origin,
    required this.country_codes,
    required this.country_code,
    required this.description,
    required this.life_span,
    required this.indoor,
    required this.lap,
    required this.adaptability,
    required this.affection_level,
    required this.child_friendly,
    required this.cat_friendly,
    required this.dog_friendly,
    required this.energy_level,
    required this.grooming,
    required this.health_issues,
    required this.intelligence,
    required this.shedding_level,
    required this.social_needs,
    required this.stranger_friendly,
    required this.vocalisation,
    required this.bidability,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressed_tail,
    required this.short_legs,
    required this.wikipedia_url,
    required this.hypoallergenic,
    required this.reference_image_id,
  });

  /// Crea una instancia de [Cat] a partir de un [Map]
  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  /// Crea un [Map] a partir de una instancia de [Cat]
  Map<String, dynamic> toJson() => _$CatToJson(this);

  /// Gato vacío
  static const empty = Cat(
    weight: Weight.empty,
    id: '',
    name: '',
    cfa_url: '',
    vetstreet_url: '',
    vcahospitals_url: '',
    temperament: '',
    origin: '',
    country_codes: '',
    country_code: '',
    description: '',
    life_span: '',
    indoor: 0,
    lap: 0,
    adaptability: 0,
    affection_level: 0,
    child_friendly: 0,
    cat_friendly: 0,
    dog_friendly: 0,
    energy_level: 0,
    grooming: 0,
    health_issues: 0,
    intelligence: 0,
    shedding_level: 0,
    social_needs: 0,
    stranger_friendly: 0,
    vocalisation: 0,
    bidability: 0,
    experimental: 0,
    hairless: 0,
    natural: 0,
    rare: 0,
    rex: 0,
    suppressed_tail: 0,
    short_legs: 0,
    wikipedia_url: '',
    hypoallergenic: 0,
    reference_image_id: '',
  );

  /// Peso del gato
  final Weight weight;

  /// Identificador del gato
  final String id;

  /// Nombre del gato
  final String name;

  /// URL de la CFA
  final String cfa_url;

  /// URL de la vetstreet
  final String vetstreet_url;

  /// URL de la vcahospitals
  final String vcahospitals_url;

  /// Temperamento del gato
  final String temperament;

  /// Origen del gato
  final String origin;

  /// Códigos de país
  final String country_codes;

  /// Código de país
  final String country_code;

  /// Descripción del gato
  final String description;

  /// Esperanza de vida
  final String life_span;

  /// ¿Es un gato de interior?
  final int indoor;

  /// ¿Es un gato de regazo?
  final int lap;

  /// Adaptabilidad
  final int adaptability;

  /// Nivel de afecto
  final int affection_level;

  /// ¿Es amigable con los niños?
  final int child_friendly;

  /// ¿Es amigable con los gatos?
  final int cat_friendly;

  /// ¿Es amigable con los perros?
  final int dog_friendly;

  /// Nivel de energía
  final int energy_level;

  /// Cuidado del pelaje
  final int grooming;

  /// Problemas de salud
  final int health_issues;

  /// Inteligencia
  final int intelligence;

  /// Nivel de muda
  final int shedding_level;

  /// Necesidades sociales
  final int social_needs;

  /// ¿Es amigable con los extraños?
  final int stranger_friendly;

  /// Vocalización
  final int vocalisation;

  /// Adiestrabilidad
  final int bidability;

  /// ¿Es un gato experimental?
  final int experimental;

  /// ¿Es un gato sin pelo?
  final int hairless;

  /// ¿Es un gato natural?
  final int natural;

  /// ¿Es un gato raro?
  final int rare;

  /// ¿Es un gato rex?
  final int rex;

  /// ¿Tiene la cola suprimida?
  final int suppressed_tail;

  /// ¿Tiene las patas cortas?
  final int short_legs;

  /// URL de Wikipedia
  final String wikipedia_url;

  /// ¿Es hipoalergénico?
  final int hypoallergenic;

  /// Identificador de la imagen de referencia
  final String reference_image_id;

  @override
  List<Object?> get props => [
        weight,
        id,
        name,
        cfa_url,
        vetstreet_url,
        vcahospitals_url,
        temperament,
        origin,
        country_codes,
        country_code,
        description,
        life_span,
        indoor,
        lap,
        adaptability,
        affection_level,
        child_friendly,
        cat_friendly,
        dog_friendly,
        energy_level,
        grooming,
        health_issues,
        intelligence,
        shedding_level,
        social_needs,
        stranger_friendly,
        vocalisation,
        bidability,
        experimental,
        hairless,
        natural,
        rare,
        rex,
        suppressed_tail,
        short_legs,
        wikipedia_url,
        hypoallergenic,
        reference_image_id,
      ];
}
