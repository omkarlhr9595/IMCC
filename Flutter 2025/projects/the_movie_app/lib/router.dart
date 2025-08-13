import 'package:go_router/go_router.dart';
import 'features/trending_movies/presentation/screens/trending_screen.dart';
import 'features/trending_movies/presentation/screens/movie_details_screen.dart';

class AppRouter {
  AppRouter._();

  static GoRouter create() {
    return GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          builder: (context, state) => const TrendingScreen(),
          routes: <GoRoute>[
            GoRoute(
              path: 'movie',
              name: MovieDetailsScreen.routeName,
              builder: (context, state) {
                final Object? extra = state.extra;
                return MovieDetailsScreen(movie: extra as dynamic);
              },
            ),
          ],
        ),
      ],
    );
  }
}

