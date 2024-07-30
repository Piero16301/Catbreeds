import 'package:user_api/src/models/models.dart';

/// {@template user_api}
/// User API Package
/// {@endtemplate}
abstract class IUserApi {
  /// {@macro user_api}
  const IUserApi();

  /// Obtener lista de gatos por paginación
  Future<List<Cat>> getCatsPaginated({int limit = 10, int page = 1});

  /// Buscar gatos por nombre
  Future<List<Cat>> searchCatsByName(String name);

  /// Obtener imagen de un gato
  Future<String> getCatImage(String id);
}
