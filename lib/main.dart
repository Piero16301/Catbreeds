import 'package:catbreeds/app/app.dart';
import 'package:catbreeds/bootstrap.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:user_api_remote/user_api_remote.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar variables de entorno
  await dotenv.load(fileName: './.env');

  // Cliente HTTP
  final httpClient = Dio(
    BaseOptions(
      baseUrl: dotenv.get('API_URL'),
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      validateStatus: (status) => true,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  // Inicializar User API
  final userApi = UserApiRemote(httpClient: httpClient);

  // Inicializar UserRepository
  final userRepository = UserRepository(userApi: userApi);

  // Inicializar la aplicación
  await bootstrap(
    () => AppPage(
      userRepository: userRepository,
    ),
  );
}
