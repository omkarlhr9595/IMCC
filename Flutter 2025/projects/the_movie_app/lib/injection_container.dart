import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/trending_movies/data/datasources/local/trending_local_data_source.dart';
import 'features/trending_movies/data/datasources/remote/trending_remote_data_source.dart';
import 'features/trending_movies/data/repositories/trending_repository_impl.dart';
import 'features/trending_movies/domain/repositories/trending_repository.dart';
import 'features/trending_movies/domain/usecases/get_trending_movies.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  sl.registerLazySingleton<DioClient>(() => DioClient());
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  // Data sources
  sl.registerLazySingleton<TrendingLocalDataSource>(() => TrendingLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<TrendingRemoteDataSource>(() => TrendingRemoteDataSourceImpl(sl(), sl()));

  // Repositories
  sl.registerLazySingleton<TrendingRepository>(() => TrendingRepositoryImpl(sl(), sl()));

  // Use cases
  sl.registerFactory<GetTrendingMoviesUseCase>(() => GetTrendingMoviesUseCase(sl()));

  // Blocs are created with BlocProvider near the UI instead of DI.
}
