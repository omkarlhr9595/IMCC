import 'package:notes_crud_app/feature/notes/data/datasource/firebase_notes_datasource.dart';
import 'package:notes_crud_app/feature/notes/data/models/note_model.dart';

abstract class NotesRepository {
  Future<List<NoteModel>> getNotes();
  Future<NoteModel?> getNoteById(String id);
  Future<String> createNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
  Future<void> deleteNote(String id);
  Future<List<NoteModel>> searchNotes(String query);
  Future<List<NoteModel>> getNotesByTag(String tag);
}

class NotesRepositoryImpl implements NotesRepository {
  final NotesDataSource _dataSource;

  NotesRepositoryImpl({NotesDataSource? dataSource})
      : _dataSource = dataSource ?? FirebaseNotesDataSource();

  @override
  Future<List<NoteModel>> getNotes() async {
    return await _dataSource.getNotes();
  }

  @override
  Future<NoteModel?> getNoteById(String id) async {
    return await _dataSource.getNoteById(id);
  }

  @override
  Future<String> createNote(NoteModel note) async {
    final now = DateTime.now();
    final noteWithTimestamps = note.copyWith(
      createdAt: now,
      updatedAt: now,
    );
    return await _dataSource.createNote(noteWithTimestamps);
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    await _dataSource.updateNote(note);
  }

  @override
  Future<void> deleteNote(String id) async {
    await _dataSource.deleteNote(id);
  }

  @override
  Future<List<NoteModel>> searchNotes(String query) async {
    return await _dataSource.searchNotes(query);
  }

  @override
  Future<List<NoteModel>> getNotesByTag(String tag) async {
    return await _dataSource.getNotesByTag(tag);
  }


} 