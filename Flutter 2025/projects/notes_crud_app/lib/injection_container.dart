import 'package:get_it/get_it.dart';
import 'package:notes_crud_app/core/network/dio_client.dart';
import 'package:notes_crud_app/feature/notes/data/data.dart';
import 'package:notes_crud_app/feature/notes/domain/usecases/create_note.dart';
import 'package:notes_crud_app/feature/notes/domain/usecases/delete_note.dart';
import 'package:notes_crud_app/feature/notes/domain/usecases/get_notes.dart';
import 'package:notes_crud_app/feature/notes/domain/usecases/search_notes.dart';
import 'package:notes_crud_app/feature/notes/domain/usecases/update_note.dart';
import 'package:notes_crud_app/feature/notes/domain/domain.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<DioClient>(() => DioClient());

  // Data sources
  sl.registerLazySingleton<NotesDataSource>(
    () => FirebaseNotesDataSource(),
  );

  // Repositories
  sl.registerLazySingleton<NotesRepository>(
    () => NotesRepositoryImpl(dataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetNotes(sl()));
  sl.registerLazySingleton(() => CreateNote(sl()));
  sl.registerLazySingleton(() => UpdateNote(sl()));
  sl.registerLazySingleton(() => DeleteNote(sl()));
  sl.registerLazySingleton(() => SearchNotes(sl()));
}
