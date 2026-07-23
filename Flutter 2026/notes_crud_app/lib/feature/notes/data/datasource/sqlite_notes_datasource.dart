import 'package:notes_crud_app/core/database/sqlite_database.dart';
import 'package:notes_crud_app/feature/notes/data/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class NotesDataSource {
  Future<List<NoteModel>> getNotes();
  Future<NoteModel?> getNoteById(String id);
  Future<String> createNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
  Future<void> deleteNote(String id);
}

class SqliteNotesDataSource implements NotesDataSource {
  static const String _tableName = 'notes';

  @override
  Future<List<NoteModel>> getNotes() async {
    try {
      final db = await SqliteDatabase.instance;
      final maps = await db.query(
        _tableName,
        orderBy: 'updatedAt DESC',
      );

      final notes = maps.map((map) => NoteModel.fromJson(map)).toList();

      // Sort: pinned first, then by updatedAt
      notes.sort((a, b) {
        if (a.isPinned != b.isPinned) {
          return b.isPinned ? 1 : -1;
        }
        return b.updatedAt.compareTo(a.updatedAt);
      });

      return notes;
    } catch (e) {
      throw Exception('Failed to fetch notes: $e');
    }
  }

  @override
  Future<NoteModel?> getNoteById(String id) async {
    try {
      final db = await SqliteDatabase.instance;
      final maps = await db.query(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isEmpty) {
        return null;
      }

      return NoteModel.fromJson(maps.first);
    } catch (e) {
      throw Exception('Failed to fetch note: $e');
    }
  }

  @override
  Future<String> createNote(NoteModel note) async {
    try {
      final db = await SqliteDatabase.instance;
      final id = DateTime.now().millisecondsSinceEpoch.toString();

      final noteToInsert = note.copyWith(id: id);

      await db.insert(
        _tableName,
        noteToInsert.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return id;
    } catch (e) {
      throw Exception('Failed to create note: $e');
    }
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    try {
      if (note.id == null) {
        throw Exception('Note ID is required for update');
      }

      final db = await SqliteDatabase.instance;
      final updatedNote = note.copyWith(
        updatedAt: DateTime.now(),
      );

      await db.update(
        _tableName,
        updatedNote.toJson(),
        where: 'id = ?',
        whereArgs: [note.id],
      );
    } catch (e) {
      throw Exception('Failed to update note: $e');
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    try {
      final db = await SqliteDatabase.instance;
      await db.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception('Failed to delete note: $e');
    }
  }

  Future<void> togglePin(String noteId, bool isPinned) async {
    try {
      final db = await SqliteDatabase.instance;
      await db.update(
        _tableName,
        {
          'isPinned': isPinned ? 1 : 0,
          'updatedAt': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [noteId],
      );
    } catch (e) {
      throw Exception('Failed to toggle pin: $e');
    }
  }
}
