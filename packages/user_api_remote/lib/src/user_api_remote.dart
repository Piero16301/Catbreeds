import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:user_api/user_api.dart';

/// {@template user_api_remote}
/// User API Remote Package
/// {@endtemplate}
class UserApiRemote implements IUserApi {
  /// {@macro user_api_remote}
  UserApiRemote({
    required Dio httpClient,
  }) : _httpClient = httpClient {
    init();
  }

  final Dio _httpClient;

  /// Inicializa el paquete
  void init() {
    _httpClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['x-api-key'] = dotenv.get('API_KEY');
          return handler.next(options);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  @override
  Future<List<Cat>> getCatsPaginated({int limit = 10, int page = 1}) async {
    try {
      final response = await _httpClient.get<List<dynamic>>(
        '/v1/breeds',
        queryParameters: {
          'limit': limit,
          'page': page,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Error al obtener la lista de gatos');
      }

      final catsJson = response.data!;
      final cats = catsJson
          .map((json) => Cat.fromJson(json as Map<String, dynamic>))
          .toList();

      return cats;
    } catch (e) {
      throw Exception('Error al obtener la lista de gatos');
    }
  }

  @override
  Future<List<Cat>> searchCatsByName(String name) async {
    try {
      final response = await _httpClient.get<List<dynamic>>(
        '/v1/breeds/search',
        queryParameters: {
          'q': name,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Error al buscar gatos por nombre');
      }

      final catsJson = response.data!;
      final cats = catsJson
          .map((json) => Cat.fromJson(json as Map<String, dynamic>))
          .toList();

      return cats;
    } catch (e) {
      throw Exception('Error al buscar gatos por nombre');
    }
  }

  @override
  Future<String> getCatImage(String id) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '/v1/images/$id',
      );

      if (response.statusCode != 200) {
        throw Exception('Error al obtener la imagen de un gato');
      }

      final imageJson = response.data!;
      final image = imageJson['url'] as String? ?? '';

      return image;
    } catch (e) {
      throw Exception('Error al obtener la imagen de un gato');
    }
  }
}
