import 'package:user_api/user_api.dart';

/// {@template user_repository}
/// User Repository Package
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  const UserRepository({
    required IUserApi userApi,
  }) : _userApi = userApi;

  final IUserApi _userApi;

  /// Obtener lista de gatos por paginación
  Future<List<Cat>> getCatsPaginated({int limit = 10, int page = 1}) =>
      _userApi.getCatsPaginated(limit: limit, page: page);

  /// Buscar gatos por nombre
  Future<List<Cat>> searchCatsByName(String name) =>
      _userApi.searchCatsByName(name);

  /// Obtener imagen de un gato
  Future<String> getCatImage(String id) => _userApi.getCatImage(id);
}
