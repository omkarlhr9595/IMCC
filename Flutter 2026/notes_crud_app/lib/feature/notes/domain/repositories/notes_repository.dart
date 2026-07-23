import 'package:notes_crud_app/feature/notes/domain/entities/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getNotes();
  Future<Note?> getNoteById(String id);
  Future<String> createNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNote(String id);
}
