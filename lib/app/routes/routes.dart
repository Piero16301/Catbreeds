import 'package:catbreeds/home/home.dart';
import 'package:catbreeds/search/search.dart';
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
        routes: [
          GoRoute(
            name: 'search',
            path: 'search/:name',
            builder: (context, state) {
              final name = state.pathParameters['name']!;
              return SearchPage(name: name);
            },
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
  );
}
