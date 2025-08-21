import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  sl.registerLazySingleton<DioClient>(() => DioClient());

  // Data sources

  // Repositories

  // Use cases

  // Blocs are created with BlocProvider near the UI instead of DI.
}
