# 📝 Notes CRUD App

A Flutter application built with **Clean Architecture** and **BLoC pattern** for managing notes with Firebase Firestore backend.

## 🏗️ Architecture Overview

This application follows **Clean Architecture** principles combined with the **BLoC (Business Logic Component)** pattern for state management. The app is structured in layers that promote separation of concerns, testability, and maintainability.

---

## 🔄 Application Flow & Data Journey

### 1. Application Startup Flow
```
main.dart → injection_container.dart → app.dart → NotesListScreen
```

- **`main.dart`**: Entry point that initializes Firebase and launches the app
- **`injection_container.dart`**: Sets up dependency injection using GetIt service locator
- **`app.dart`**: Configures the app theme and provides BLoC providers
- **`NotesListScreen`**: The main UI screen that displays all notes

### 2. Data Flow Architecture (Top-Down)
```
UI Layer (Presentation) → Business Logic Layer (Domain) → Data Layer
```

- **Presentation Layer**: Contains screens, widgets, and BLoC components
- **Domain Layer**: Contains business entities, use cases, and repository interfaces
- **Data Layer**: Contains data sources, models, and repository implementations

### 3. Detailed Component Flow

#### A. User Interaction Flow:
```
User creates note → CreateNoteEvent → NotesBloc → 
CreateNoteUseCase → NotesRepository → FirebaseNotesDataSource → 
Firebase Firestore → Response flows back up the chain
```

#### B. Data Transformation Flow:
```
Firebase Response → NoteModel (JSON parsing) → Note Entity → 
UI State Update → NotesListScreen rebuilds
```

---

## 🏗️ Key Components & Their Responsibilities

### Core Components
- **`DioClient`**: HTTP client configured with Firebase settings
- **`ApiConfig`**: Centralized API configuration
- **`Result<T>`**: Generic wrapper for handling success/failure states
- **`Exception/Failure Classes`**: Error handling and mapping

### Feature Components (Notes)
- **`NotesBloc`**: Manages UI state and coordinates data flow
- **`CreateNoteUseCase`**: Business logic for creating notes
- **`GetNotesUseCase`**: Business logic for fetching notes
- **`UpdateNoteUseCase`**: Business logic for updating notes
- **`DeleteNoteUseCase`**: Business logic for deleting notes
- **`SearchNotesUseCase`**: Business logic for searching notes
- **`NotesRepository`**: Abstract interface for data operations
- **`NotesRepositoryImpl`**: Concrete implementation of repository
- **`FirebaseNotesDataSource`**: Handles Firestore operations
- **`NoteModel`**: Data model for JSON parsing
- **`Note Entity`**: Business entity used throughout the app

---

## 🔧 Dependency Injection Flow

**GetIt Service Locator registers:**
1. `DioClient` (Network layer)
2. `FirebaseNotesDataSource` (Data source)
3. `NotesRepository` (Repository interface)
4. All Use Cases (Business logic)
5. BLoCs are created via `BlocProvider` in UI layer

---

## 📊 State Management Flow

**NotesBloc States:**
```
Initial → Loading → Success/Failure
```

**Events:**
- `LoadNotes`
- `CreateNote`
- `UpdateNote`
- `DeleteNote`
- `SearchNotes`
- `ToggleNotePin`

---

## ❌ Error Handling Flow

```
Firebase Error → Exception → FailureResult → 
NotesErrorState → UI displays error message
```

---

## ✅ Features

- **Full CRUD Operations**: Create, Read, Update, Delete notes
- **Search Functionality**: Search notes by title
- **Tag Management**: Organize notes with tags
- **Pinning**: Pin important notes to the top
- **Automatic Timestamps**: Creation and update timestamps
- **JSON Serialization**: Easy serialization/deserialization
- **Firebase Integration**: Direct Firestore operations
- **Modern UI**: Material 3 design with dark/light themes
- **Responsive Design**: Works on all screen sizes

---

## 📁 Complete File Organization Structure

```
lib/
├── core/                    # Shared utilities and infrastructure
│   ├── config/
│   │   └── api_config.dart
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   └── dio_client.dart
│   ├── result/
│   │   └── result.dart
│   └── usecases/
│       └── usecase.dart
├── feature/                 # Feature-specific modules
│   └── notes/
│       ├── data/           # Data layer implementation
│       │   ├── datasources/
│       │   │   └── firebase_notes_datasource.dart
│       │   ├── models/
│       │   │   ├── note_model.dart
│       │   │   └── note_model.g.dart
│       │   ├── repository/
│       │   │   └── notes_repository_impl.dart
│       │   └── data.dart
│       ├── domain/         # Business logic layer
│       │   ├── entities/
│       │   │   └── note.dart
│       │   ├── repositories/
│       │   │   └── notes_repository.dart
│       │   ├── usecases/
│       │   │   ├── create_note.dart
│       │   │   ├── delete_note.dart
│       │   │   ├── get_notes.dart
│       │   │   ├── search_notes.dart
│       │   │   └── update_note.dart
│       │   └── domain.dart
│       └── presentation/   # UI layer
│           ├── bloc/
│           │   ├── notes_bloc.dart
│           │   ├── notes_event.dart
│           │   └── notes_state.dart
│           ├── screens/
│           │   ├── notes_list_screen.dart
│           │   └── note_detail_screen.dart
│           ├── widgets/
│           │   ├── note_card.dart
│           │   ├── search_bar_widget.dart
│           │   └── add_note_fab.dart
│           └── presentation.dart
├── injection_container.dart
├── app.dart
└── main.dart
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.4.3 or higher)
- Firebase project with Firestore enabled
- iOS 15.0+ / Android API 21+

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd notes_crud_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a Firebase project
   - Enable Firestore
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the respective platform directories

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 📱 Usage Examples

### Creating a Note
```dart
// Create a new note
final note = Note(
  title: 'My First Note',
  content: 'This is the content of my note',
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
  tags: ['personal', 'important'],
);

// Save to Firebase
final repository = NotesRepositoryImpl();
final noteId = await repository.createNote(note);
```

### Fetching Notes
```dart
// Get all notes
final notes = await repository.getNotes();

// Search notes
final results = await repository.searchNotes('search query');

// Get notes by tag
final taggedNotes = await repository.getNotesByTag('important');
```

---

## 🔧 Configuration

### Firebase Configuration
The app uses Firebase Firestore for data persistence. Ensure your Firebase project is properly configured with:

- Firestore database enabled
- Proper security rules
- Authentication (if needed)

### Environment Variables
Create a `.env` file in the root directory:
```env
FIREBASE_API_KEY=your_api_key_here
```

---

## 🧪 Testing

The application is designed with testability in mind:

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/
```

---

## 📊 File Count Summary

| Metric | Count |
|--------|-------|
| **Total Files** | 25+ |
| **Core Module** | 6 files |
| **Features Module** | 19+ files |
| **Lines of Code** | ~1,500+ lines |
| **Architecture Pattern** | Clean Architecture with BLoC pattern |
| **State Management** | Flutter BLoC |
| **Dependency Injection** | GetIt service locator |
| **Backend** | Firebase Firestore |
| **Error Handling** | Custom Result<T> pattern with exceptions and failures |

---

## 🎯 Benefits of This Architecture

1. **Separation of Concerns**: Each layer has a specific responsibility
2. **Testability**: Business logic can be tested independently
3. **Maintainability**: Changes in one layer don't affect others
4. **Scalability**: Easy to add new features following the same pattern
5. **Dependency Inversion**: High-level modules don't depend on low-level modules
6. **Clean Code**: Well-structured, readable, and maintainable codebase

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- BLoC pattern for state management
- Firebase for backend services
- Clean Architecture principles

---

*Built with ❤️ using Flutter and Clean Architecture* 🚀