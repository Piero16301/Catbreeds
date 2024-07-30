import 'package:catbreeds/home/home.dart';
import 'package:catbreeds/splash/splash.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        name: 'splash',
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
    debugLogDiagnostics: true,
  );
}
