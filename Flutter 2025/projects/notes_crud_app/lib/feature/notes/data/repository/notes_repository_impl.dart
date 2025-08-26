import 'package:notes_crud_app/feature/notes/data/datasource/firebase_notes_datasource.dart';
import 'package:notes_crud_app/feature/notes/data/models/note_model.dart';
import 'package:notes_crud_app/feature/notes/domain/domain.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesDataSource _dataSource;

  NotesRepositoryImpl({NotesDataSource? dataSource}) : _dataSource = dataSource ?? FirebaseNotesDataSource();

  @override
  Future<List<Note>> getNotes() async {
    final noteModels = await _dataSource.getNotes();
    return noteModels.map((model) => _mapToEntity(model)).toList();
  }

  @override
  Future<Note?> getNoteById(String id) async {
    final noteModel = await _dataSource.getNoteById(id);
    return noteModel != null ? _mapToEntity(noteModel) : null;
  }

  @override
  Future<String> createNote(Note note) async {
    final now = DateTime.now();
    final noteWithTimestamps = note.copyWith(
      createdAt: now,
      updatedAt: now,
    );
    final noteModel = _mapToModel(noteWithTimestamps);
    return await _dataSource.createNote(noteModel);
  }

  @override
  Future<void> updateNote(Note note) async {
    final noteModel = _mapToModel(note);
    await _dataSource.updateNote(noteModel);
  }

  @override
  Future<void> deleteNote(String id) async {
    await _dataSource.deleteNote(id);
  }

  // Mapper methods
  Note _mapToEntity(NoteModel model) {
    return Note(
      id: model.id,
      title: model.title,
      content: model.content,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      isPinned: model.isPinned,
    );
  }

  NoteModel _mapToModel(Note entity) {
    return NoteModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      isPinned: entity.isPinned,
    );
  }
}
