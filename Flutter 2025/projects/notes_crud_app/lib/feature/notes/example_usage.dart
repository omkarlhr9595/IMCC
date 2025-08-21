import 'package:notes_crud_app/feature/notes/data/data.dart';

/// Example usage of the Notes data layer
class NotesExample {
  final NotesRepository _repository = NotesRepositoryImpl();

  /// Example: Create and save a new note
  Future<String> createExampleNote() async {
    try {
      // Create a new note using the factory method
      final note = NoteModel.create(
        title: 'Example Note',
        content: 'This is an example note created for demonstration purposes.',
        tags: ['example', 'demo'],
      );

      // Save to Firebase and get the generated ID
      final noteId = await _repository.createNote(note);
      print('Note created with ID: $noteId');
      return noteId;
    } catch (e) {
      print('Error creating note: $e');
      rethrow;
    }
  }

  /// Example: Fetch all notes
  Future<List<NoteModel>> getAllNotes() async {
    try {
      final notes = await _repository.getNotes();
      print('Found ${notes.length} notes');
      return notes;
    } catch (e) {
      print('Error fetching notes: $e');
      rethrow;
    }
  }

  /// Example: Search notes by query
  Future<List<NoteModel>> searchNotes(String query) async {
    try {
      final results = await _repository.searchNotes(query);
      print('Found ${results.length} notes matching "$query"');
      return results;
    } catch (e) {
      print('Error searching notes: $e');
      rethrow;
    }
  }

  /// Example: Update a note
  Future<void> updateExampleNote(String noteId) async {
    try {
      // First, fetch the existing note
      final existingNote = await _repository.getNoteById(noteId);
      if (existingNote == null) {
        print('Note not found');
        return;
      }

      // Update the note
      final updatedNote = existingNote.copyWith(
        title: 'Updated Example Note',
        content: 'This note has been updated with new content.',
        tags: ['example', 'demo', 'updated'],
      );

      await _repository.updateNote(updatedNote);
      print('Note updated successfully');
    } catch (e) {
      print('Error updating note: $e');
      rethrow;
    }
  }

  /// Example: Delete a note
  Future<void> deleteExampleNote(String noteId) async {
    try {
      await _repository.deleteNote(noteId);
      print('Note deleted successfully');
    } catch (e) {
      print('Error deleting note: $e');
      rethrow;
    }
  }

  /// Example: Get notes by tag
  Future<List<NoteModel>> getNotesByTag(String tag) async {
    try {
      final notes = await _repository.getNotesByTag(tag);
      print('Found ${notes.length} notes with tag "$tag"');
      return notes;
    } catch (e) {
      print('Error fetching notes by tag: $e');
      rethrow;
    }
  }

  /// Example: Complete workflow
  Future<void> runCompleteExample() async {
    try {
      print('=== Starting Notes Example ===');
      
      // 1. Create a note
      final noteId = await createExampleNote();
      
      // 2. Fetch all notes
      await getAllNotes();
      
      // 3. Search for the note
      await searchNotes('Example');
      
      // 4. Get notes by tag
      await getNotesByTag('example');
      
      // 5. Update the note
      await updateExampleNote(noteId);
      
      // 6. Fetch updated notes
      await getAllNotes();
      
      // 7. Delete the note
      await deleteExampleNote(noteId);
      
      // 8. Verify deletion
      await getAllNotes();
      
      print('=== Notes Example Completed ===');
    } catch (e) {
      print('Example failed: $e');
    }
  }
}

/// Usage in your app:
/// 
/// ```dart
/// void main() async {
///   // Initialize Firebase first
///   await Firebase.initializeApp();
///   
///   // Run the example
///   final example = NotesExample();
///   await example.runCompleteExample();
/// }
/// ``` 