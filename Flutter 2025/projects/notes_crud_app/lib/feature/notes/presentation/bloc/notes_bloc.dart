import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_crud_app/core/usecases/usecase.dart';
import 'package:notes_crud_app/feature/notes/domain/entities/note.dart';
import 'package:notes_crud_app/feature/notes/domain/usecases/create_note.dart' as create_note;
import 'package:notes_crud_app/feature/notes/domain/usecases/delete_note.dart' as delete_note;
import 'package:notes_crud_app/feature/notes/domain/usecases/get_notes.dart' as get_notes;
import 'package:notes_crud_app/feature/notes/domain/usecases/update_note.dart' as update_note;

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final get_notes.GetNotes _getNotesUseCase;
  final create_note.CreateNote _createNoteUseCase;
  final update_note.UpdateNote _updateNoteUseCase;
  final delete_note.DeleteNote _deleteNoteUseCase;

  NotesBloc({
    required get_notes.GetNotes getNotesUseCase,
    required create_note.CreateNote createNoteUseCase,
    required update_note.UpdateNote updateNoteUseCase,
    required delete_note.DeleteNote deleteNoteUseCase,
  })  : _getNotesUseCase = getNotesUseCase,
        _createNoteUseCase = createNoteUseCase,
        _updateNoteUseCase = updateNoteUseCase,
        _deleteNoteUseCase = deleteNoteUseCase,
        super(NotesInitial()) {
    on<LoadNotes>(_onLoadNotes);
    on<CreateNote>(_onCreateNote);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);
    on<ToggleNotePin>(_onToggleNotePin);
  }

  Future<void> _onLoadNotes(LoadNotes event, Emitter<NotesState> emit) async {
    emit(NotesLoading());
    try {
      final result = await _getNotesUseCase(const NoParams());
      result.when(
        success: (notes) => emit(NotesLoaded(notes)),
        failure: (failure) => emit(NotesError(failure.message)),
      );
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> _onCreateNote(CreateNote event, Emitter<NotesState> emit) async {
    try {
      final note = Note(
        title: event.title,
        content: event.content,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        tags: event.tags,
      );

      final result = await _createNoteUseCase(note);
      result.when(
        success: (noteId) {
          final createdNote = note.copyWith(id: noteId);
          if (state is NotesLoaded) {
            final currentNotes = (state as NotesLoaded).notes;
            final updatedNotes = [createdNote, ...currentNotes];
            emit(NotesLoaded(updatedNotes));
          }
        },
        failure: (failure) => emit(NotesError(failure.message)),
      );
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> _onUpdateNote(UpdateNote event, Emitter<NotesState> emit) async {
    try {
      final updatedNote = event.note.copyWith(
        updatedAt: DateTime.now(),
      );

      final result = await _updateNoteUseCase(updatedNote);
      result.when(
        success: (_) {
          if (state is NotesLoaded) {
            final currentNotes = (state as NotesLoaded).notes;
            final updatedNotes = currentNotes.map((note) {
              return note.id == updatedNote.id ? updatedNote : note;
            }).toList();
            emit(NotesLoaded(updatedNotes));
          }
        },
        failure: (failure) => emit(NotesError(failure.message)),
      );
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<NotesState> emit) async {
    try {
      final result = await _deleteNoteUseCase(event.noteId);
      result.when(
        success: (_) {
          if (state is NotesLoaded) {
            final currentNotes = (state as NotesLoaded).notes;
            final updatedNotes = currentNotes.where((note) => note.id != event.noteId).toList();
            emit(NotesLoaded(updatedNotes));
          }
        },
        failure: (failure) => emit(NotesError(failure.message)),
      );
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> _onToggleNotePin(ToggleNotePin event, Emitter<NotesState> emit) async {
    try {
      if (state is NotesLoaded) {
        final currentNotes = (state as NotesLoaded).notes;
        final noteToUpdate = currentNotes.firstWhere((note) => note.id == event.noteId);
        final updatedNote = noteToUpdate.copyWith(
          isPinned: event.isPinned,
          updatedAt: DateTime.now(),
        );

        final result = await _updateNoteUseCase(updatedNote);
        result.when(
          success: (_) {
            final updatedNotes = currentNotes.map((note) {
              return note.id == event.noteId ? updatedNote : note;
            }).toList();

            // Sort notes: pinned first, then by updatedAt
            updatedNotes.sort((a, b) {
              if (a.isPinned != b.isPinned) {
                return b.isPinned ? 1 : -1;
              }
              return b.updatedAt.compareTo(a.updatedAt);
            });

            emit(NotesLoaded(updatedNotes));
          },
          failure: (failure) => emit(NotesError(failure.message)),
        );
      }
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
