import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_crud_app/feature/notes/domain/usecases/create_note.dart' as create_note;
import 'package:notes_crud_app/feature/notes/domain/usecases/delete_note.dart' as delete_note;
import 'package:notes_crud_app/feature/notes/domain/usecases/get_notes.dart' as get_notes;
import 'package:notes_crud_app/feature/notes/domain/usecases/update_note.dart' as update_note;
import 'package:notes_crud_app/feature/notes/presentation/presentation.dart';
import 'package:notes_crud_app/injection_container.dart' as di;

class MyNotesApp extends StatefulWidget {
  const MyNotesApp({super.key});

  @override
  State<MyNotesApp> createState() => _MyNotesAppState();
}

class _MyNotesAppState extends State<MyNotesApp> {
  @override
  void initState() {
    super.initState();
    di.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotesBloc>(
          create: (context) => NotesBloc(
            getNotesUseCase: di.sl<get_notes.GetNotes>(),
            createNoteUseCase: di.sl<create_note.CreateNote>(),
            updateNoteUseCase: di.sl<update_note.UpdateNote>(),
            deleteNoteUseCase: di.sl<delete_note.DeleteNote>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Notes CRUD App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
          ),
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
          ),
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        themeMode: ThemeMode.system,
        home: const NotesListScreen(),
        routes: {
          '/note-detail': (context) => NoteDetailScreen.fromArguments(
                ModalRoute.of(context)?.settings.arguments,
              ),
        },
      ),
    );
  }
}
