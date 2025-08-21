import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_crud_app/feature/notes/data/models/note_model.dart';

abstract class NotesDataSource {
  Future<List<NoteModel>> getNotes();
  Future<NoteModel?> getNoteById(String id);
  Future<String> createNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
  Future<void> deleteNote(String id);
  Future<List<NoteModel>> searchNotes(String query);
  Future<List<NoteModel>> getNotesByTag(String tag);
}

class FirebaseNotesDataSource implements NotesDataSource {
  final FirebaseFirestore _firestore;
  final String _collectionName = 'notes';

  FirebaseNotesDataSource({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<NoteModel>> getNotes() async {
    try {
      final querySnapshot = await _firestore
          .collection(_collectionName)
          .orderBy('isPinned', descending: true)
          .orderBy('updatedAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => NoteModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch notes: $e');
    }
  }

  @override
  Future<NoteModel?> getNoteById(String id) async {
    try {
      final docSnapshot = await _firestore
          .collection(_collectionName)
          .doc(id)
          .get();

      if (docSnapshot.exists) {
        return NoteModel.fromFirestore(docSnapshot);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch note: $e');
    }
  }

  @override
  Future<String> createNote(NoteModel note) async {
    try {
      final docRef = await _firestore
          .collection(_collectionName)
          .add(note.toFirestore());
      return docRef.id;
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

      final updatedNote = note.copyWith(
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection(_collectionName)
          .doc(note.id)
          .update(updatedNote.toFirestore());
    } catch (e) {
      throw Exception('Failed to update note: $e');
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(id)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete note: $e');
    }
  }

  @override
  Future<List<NoteModel>> searchNotes(String query) async {
    try {
      if (query.isEmpty) {
        return await getNotes();
      }

      final querySnapshot = await _firestore
          .collection(_collectionName)
          .where('title', isGreaterThanOrEqualTo: query)
          .where('title', isLessThan: query + '\uf8ff')
          .orderBy('title')
          .orderBy('updatedAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => NoteModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Failed to search notes: $e');
    }
  }

  @override
  Future<List<NoteModel>> getNotesByTag(String tag) async {
    try {
      final querySnapshot = await _firestore
          .collection(_collectionName)
          .where('tags', arrayContains: tag)
          .orderBy('updatedAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => NoteModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch notes by tag: $e');
    }
  }

  // Additional methods for enhanced functionality
  Future<void> togglePin(String noteId, bool isPinned) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(noteId)
          .update({
        'isPinned': isPinned,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to toggle pin: $e');
    }
  }

  Future<void> addTag(String noteId, String tag) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(noteId)
          .update({
        'tags': FieldValue.arrayUnion([tag]),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add tag: $e');
    }
  }

  Future<void> removeTag(String noteId, String tag) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(noteId)
          .update({
        'tags': FieldValue.arrayRemove([tag]),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to remove tag: $e');
    }
  }
} 