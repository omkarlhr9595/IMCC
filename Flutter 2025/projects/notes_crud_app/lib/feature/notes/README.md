# Notes Feature - Data Layer

This directory contains the data layer implementation for the Notes feature using Firebase Firestore.

## Structure

```
lib/feature/notes/
├── data/
│   ├── models/
│   │   ├── note_model.dart          # Note data model with JSON serialization
│   │   └── note_model.g.dart        # Generated JSON serialization code
│   ├── datasource/
│   │   └── firebase_notes_datasource.dart  # Firebase CRUD operations
│   ├── repository/
│   │   └── notes_repository_impl.dart      # Repository implementation
│   └── data.dart                    # Barrel file for exports
└── README.md                        # This file
```

## Usage

### 1. Create a Note

```dart
import 'package:notes_crud_app/feature/notes/data/data.dart';

// Create a new note
final note = NoteModel.create(
  title: 'My First Note',
  content: 'This is the content of my note',
  tags: ['personal', 'important'],
);

// Save to Firebase
final repository = NotesRepositoryImpl();
final noteId = await repository.createNote(note);
```

### 2. Fetch Notes

```dart
// Get all notes
final notes = await repository.getNotes();

// Get note by ID
final note = await repository.getNoteById('note_id_here');

// Search notes
final searchResults = await repository.searchNotes('search query');

// Get notes by tag
final taggedNotes = await repository.getNotesByTag('important');
```

### 3. Update a Note

```dart
// Update an existing note
final updatedNote = note.copyWith(
  title: 'Updated Title',
  content: 'Updated content',
);
await repository.updateNote(updatedNote);
```

### 4. Delete a Note

```dart
await repository.deleteNote('note_id_here');
```

## Features

- **Full CRUD Operations**: Create, Read, Update, Delete notes
- **Search Functionality**: Search notes by title
- **Tag Support**: Organize notes with tags
- **Pinning**: Pin important notes to the top
- **Timestamps**: Automatic creation and update timestamps
- **JSON Serialization**: Easy serialization/deserialization
- **Firebase Integration**: Direct Firestore operations

## Dependencies

- `cloud_firestore`: Firebase Firestore operations
- `equatable`: Value equality comparison
- `json_annotation`: JSON serialization support
- `firebase_core`: Firebase core functionality

## Notes Collection Structure

The Firestore collection `notes` has the following structure:

```json
{
  "id": "auto_generated_id",
  "title": "Note Title",
  "content": "Note content...",
  "createdAt": "2024-01-01T00:00:00.000Z",
  "updatedAt": "2024-01-01T00:00:00.000Z",
  "isPinned": false,
  "tags": ["tag1", "tag2"]
}
```

## Error Handling

All operations include proper error handling and will throw exceptions with descriptive messages if operations fail. 