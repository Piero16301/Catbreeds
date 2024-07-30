import 'package:catbreeds/details/details.dart';
import 'package:catbreeds/home/home.dart';
import 'package:catbreeds/search/search.dart';
import 'package:catbreeds/splash/splash.dart';
import 'package:go_router/go_router.dart';
import 'package:user_api/user_api.dart';

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
            routes: [
              GoRoute(
                name: 'search-details',
                path: 'search-details',
                builder: (context, state) {
                  final cat = state.extra! as Cat;
                  return DetailsPage(cat: cat);
                },
              ),
            ],
          ),
          GoRoute(
            name: 'home-details',
            path: 'home-details',
            builder: (context, state) {
              final cat = state.extra! as Cat;
              return DetailsPage(cat: cat);
            },
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
  );
}
