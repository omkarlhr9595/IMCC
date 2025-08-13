import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';
import 'features/trending_movies/data/datasources/trending_remote_data_source.dart';
import 'features/trending_movies/data/repositories/trending_repository_impl.dart';
import 'features/trending_movies/domain/repositories/trending_repository.dart';
import 'features/trending_movies/domain/usecases/get_trending_movies.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  sl.registerLazySingleton<DioClient>(() => DioClient());

  // Data sources
  sl.registerLazySingleton<TrendingRemoteDataSource>(() => TrendingRemoteDataSourceImpl(sl()));

  // Repositories
  sl.registerLazySingleton<TrendingRepository>(() => TrendingRepositoryImpl(sl()));

  // Use cases
  sl.registerFactory<GetTrendingMoviesUseCase>(() => GetTrendingMoviesUseCase(sl()));

  // Blocs are created with BlocProvider near the UI instead of DI.
}
