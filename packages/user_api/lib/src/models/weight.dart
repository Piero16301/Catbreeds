import 'package:equatable/equatable.dart';

part 'weight.g.dart';

/// {@template weight}
/// Modelo de datos para el peso de un gato
/// {@endtemplate}
class Weight extends Equatable {
  /// {@macro weight}
  const Weight({
    required this.imperial,
    required this.metric,
  });

  /// Crea una instancia de [Weight] a partir de un [Map]
  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  /// Crea un [Map] a partir de una instancia de [Weight]
  Map<String, dynamic> toJson() => _$WeightToJson(this);

  /// Peso vacío
  static const empty = Weight(
    imperial: '',
    metric: '',
  );

  /// Peso en libras
  final String imperial;

  /// Peso en kilogramos
  final String metric;

  @override
  List<Object?> get props => [
        imperial,
        metric,
      ];
}
