# 🎬 Flutter Movie App Architecture
## Clean Architecture with BLoC Pattern

---

## 📋 Architecture Overview

This Flutter application follows **Clean Architecture** principles combined with the **BLoC (Business Logic Component)** pattern for state management. The app is structured in layers that promote separation of concerns, testability, and maintainability.

---

## 🔄 Application Flow & Data Journey

### 1. Application Startup Flow
```
main.dart → injection_container.dart → app.dart → TrendingScreen
```

- **`main.dart`**: Entry point that initializes dependencies and launches the app
- **`injection_container.dart`**: Sets up dependency injection using GetIt service locator
- **`app.dart`**: Configures the app theme and provides BLoC providers
- **`TrendingScreen`**: The main UI screen that displays trending movies

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
User selects time window → TrendingTimeWindowChangedEvent → TrendingBloc → 
GetTrendingMoviesUseCase → TrendingRepository → TrendingRemoteDataSource → 
DioClient → TMDB API → Response flows back up the chain
```

#### B. Data Transformation Flow:
```
TMDB API Response → MovieModel (JSON parsing) → Movie Entity → 
UI State Update → TrendingScreen rebuilds
```

---

## 🏗️ Key Components & Their Responsibilities

### Core Components
- **`DioClient`**: HTTP client configured with TMDB API settings
- **`ApiConfig`**: Centralized API configuration (base URLs, API keys)
- **`Result<T>`**: Generic wrapper for handling success/failure states
- **`Exception/Failure Classes`**: Error handling and mapping

### Feature Components (Trending Movies)
- **`TrendingBloc`**: Manages UI state and coordinates data flow
- **`GetTrendingMoviesUseCase`**: Business logic for fetching trending movies
- **`TrendingRepository`**: Abstract interface for data operations
- **`TrendingRepositoryImpl`**: Concrete implementation of repository
- **`TrendingRemoteDataSource`**: Handles API calls to TMDB
- **`MovieModel`**: Data model for JSON parsing
- **`Movie Entity`**: Business entity used throughout the app

---

## 🔧 Dependency Injection Flow

**GetIt Service Locator registers:**
1. `DioClient` (Network layer)
2. `TrendingRemoteDataSource` (Data source)
3. `TrendingRepository` (Repository interface)
4. `GetTrendingMoviesUseCase` (Use case)
5. BLoCs are created via `BlocProvider` in UI layer

---

## 📊 State Management Flow

**TrendingBloc States:**
```
Initial → Loading → Success/Failure
```

**Events:**
- `TrendingRequestedEvent`
- `TrendingTimeWindowChangedEvent`

---

## ❌ Error Handling Flow

```
API Error → DioException → ServerException → FailureResult → 
TrendingFailureState → UI displays error message
```

---

## ✅ Benefits of This Architecture

1. **Separation of Concerns**: Each layer has a specific responsibility
2. **Testability**: Business logic can be tested independently
3. **Maintainability**: Changes in one layer don't affect others
4. **Scalability**: Easy to add new features following the same pattern
5. **Dependency Inversion**: High-level modules don't depend on low-level modules

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
├── features/               # Feature-specific modules
│   └── trending_movies/
│       ├── data/          # Data layer implementation
│       │   ├── datasources/
│       │   │   └── trending_remote_data_source.dart
│       │   ├── models/
│       │   │   └── movie_model.dart
│       │   └── repositories/
│       │       └── trending_repository_impl.dart
│       ├── domain/        # Business logic layer
│       │   ├── entities/
│       │   │   └── movie.dart
│       │   ├── repositories/
│       │   │   └── trending_repository.dart
│       │   └── usecases/
│       │       └── get_trending_movies.dart
│       └── presentation/  # UI layer
│           ├── bloc/
│           │   ├── trending_bloc.dart
│           │   ├── trending_event.dart
│           │   └── trending_state.dart
│           ├── screens/
│           │   ├── trending_screen.dart
│           │   └── trending_movie_detail_screen.dart
│           └── widgets/
│               ├── movie_card.dart
│               └── time_window_segmented.dart
├── injection_container.dart
├── app.dart
└── main.dart
```

---

## 📚 Detailed File Explanations

### 1. Root Level Files

#### `main.dart` (19 lines)
- **Purpose**: Application entry point
- **Responsibilities**: 
  - Initializes Flutter bindings
  - Sets up dependency injection
  - Launches the main app
- **Key Functions**: `main()` function, `MainApp` widget

#### `app.dart` (29 lines)
- **Purpose**: Main application configuration
- **Responsibilities**:
  - Configures app theme (Material 3, Google Fonts)
  - Sets up BLoC providers
  - Defines app structure and routing
- **Key Components**: `App` widget, `MultiBlocProvider`

#### `injection_container.dart` (26 lines)
- **Purpose**: Dependency injection setup using GetIt
- **Responsibilities**:
  - Registers all dependencies (singletons and factories)
  - Manages service lifetime
  - Provides centralized dependency management

---

### 2. Core Module Files

#### `core/config/api_config.dart` (13 lines)
- **Purpose**: Centralized API configuration
- **Contains**:
  - TMDB API base URL
  - Image base URLs for different sizes
  - API key configuration
- **Usage**: Referenced by DioClient for network requests

#### `core/error/exceptions.dart` (20 lines)
- **Purpose**: Defines custom exception classes
- **Classes**:
  - `ServerException`: For server-side errors with status codes
  - `NetworkException`: For network connectivity issues
- **Usage**: Thrown by data sources when API calls fail

#### `core/error/failures.dart` (21 lines)
- **Purpose**: Defines failure classes for error handling
- **Classes**:
  - `Failure`: Abstract base class for all failures
  - `ServerFailure`: Server-related failures
  - `NetworkFailure`: Network-related failures
- **Usage**: Used in Result<T> pattern for error handling

#### `core/network/dio_client.dart` (33 lines)
- **Purpose**: HTTP client configuration and management
- **Responsibilities**:
  - Configures Dio with TMDB API settings
  - Sets timeouts and headers
  - Converts Dio exceptions to custom exceptions
- **Usage**: Used by all remote data sources

#### `core/result/result.dart` (26 lines)
- **Purpose**: Generic Result wrapper for success/failure handling
- **Classes**:
  - `Result<T>`: Abstract base class
  - `Success<T>`: Wraps successful data
  - `FailureResult<T>`: Wraps failure information
- **Usage**: Used throughout the app for consistent error handling

#### `core/usecases/usecase.dart` (9 lines)
- **Purpose**: Base classes for use cases
- **Classes**:
  - `UseCase<Output, Input>`: Abstract base for all use cases
  - `NoParams`: Utility class for use cases without parameters
- **Usage**: Base class for all business logic use cases

---

### 3. Features Module Files

#### `features/trending_movies/domain/entities/movie.dart` (25 lines)
- **Purpose**: Business entity representing a movie
- **Properties**: `id`, `title`, `overview`, `posterPath`, `backdropPath`, `releaseDate`, `voteAverage`
- **Usage**: Used throughout the app as the core movie representation
- **Note**: Implements Equatable for value comparison

#### `features/trending_movies/domain/repositories/trending_repository.dart` (10 lines)
- **Purpose**: Abstract interface for trending movies repository
- **Contains**:
  - `TimeWindow` enum (day/week)
  - Abstract method `getTrendingMovies()`
- **Usage**: Contract that data layer must implement

#### `features/trending_movies/domain/usecases/get_trending_movies.dart` (23 lines)
- **Purpose**: Business logic for fetching trending movies
- **Responsibilities**:
  - Orchestrates data retrieval
  - Handles business rules
  - Returns `Result<List<Movie>>`
- **Usage**: Called by BLoC to get trending movies

#### `features/trending_movies/data/models/movie_model.dart` (44 lines)
- **Purpose**: Data model for JSON parsing
- **Responsibilities**:
  - JSON serialization/deserialization
  - Converts to/from Movie entity
- **Usage**: Used by data sources to parse API responses

#### `features/trending_movies/data/repositories/trending_repository_impl.dart` (30 lines)
- **Purpose**: Concrete implementation of trending repository
- **Responsibilities**:
  - Implements repository interface
  - Coordinates between data sources
  - Maps data models to entities
  - Handles error conversion
- **Usage**: Registered in dependency injection

#### `features/trending_movies/data/datasources/trending_remote_data_source.dart` (35 lines)
- **Purpose**: Handles API calls to TMDB
- **Responsibilities**:
  - Makes HTTP requests to trending movies endpoint
  - Parses API responses
  - Converts to MovieModel objects
  - Handles API-specific errors
- **Usage**: Called by repository implementation

#### `features/trending_movies/presentation/bloc/trending_bloc.dart` (53 lines)
- **Purpose**: Main business logic coordinator for trending movies
- **Responsibilities**:
  - Manages UI state
  - Handles user events
  - Coordinates with use cases
  - Emits state changes
- **Usage**: Manages all trending movies functionality

#### `features/trending_movies/presentation/bloc/trending_event.dart` (21 lines)
- **Purpose**: Defines events that BLoC can handle
- **Events**:
  - `TrendingRequestedEvent`: Request to fetch trending movies
  - `TrendingTimeWindowChangedEvent`: User changed time window
- **Usage**: Sent from UI to trigger BLoC actions

#### `features/trending_movies/presentation/bloc/trending_state.dart` (34 lines)
- **Purpose**: Defines possible UI states
- **States**:
  - `TrendingInitialState`: Initial app state
  - `TrendingLoadingState`: Loading state
  - `TrendingSuccessState`: Success with movie data
  - `TrendingFailureState`: Error state
- **Usage**: UI rebuilds based on these states

#### `features/trending_movies/presentation/screens/trending_screen.dart` (74 lines)
- **Purpose**: Main screen displaying trending movies
- **Responsibilities**:
  - Shows movie grid/list
  - Handles time window selection
  - Displays loading/error states
- **Usage**: Main entry point for trending movies feature

#### `features/trending_movies/presentation/screens/trending_movie_detail_screen.dart` (114 lines)
- **Purpose**: Detailed view of a selected movie
- **Responsibilities**:
  - Shows comprehensive movie information
  - Displays poster, backdrop, and details
- **Usage**: Navigation destination from movie selection

#### `features/trending_movies/presentation/widgets/movie_card.dart` (90 lines)
- **Purpose**: Reusable widget for displaying movie information
- **Responsibilities**:
  - Shows movie poster, title, rating
  - Handles tap events for navigation
- **Usage**: Used in movie grids and lists

#### `features/trending_movies/presentation/widgets/time_window_segmented.dart` (39 lines)
- **Purpose**: UI control for selecting time window (day/week)
- **Responsibilities**:
  - Provides segmented control interface
  - Triggers time window change events
- **Usage**: Allows users to switch between daily/weekly trending

---

## 📊 File Count Summary

| Metric | Count |
|--------|-------|
| **Total Files** | 25 |
| **Core Module** | 6 files |
| **Features Module** | 19 files |
| **Lines of Code** | ~1,000+ lines |
| **Architecture Pattern** | Clean Architecture with BLoC pattern |
| **State Management** | Flutter BLoC |
| **Dependency Injection** | GetIt service locator |
| **Network Layer** | Dio HTTP client |
| **Error Handling** | Custom Result<T> pattern with exceptions and failures |

---

## 🎯 Conclusion

This structure follows **Flutter best practices** and **Clean Architecture principles**, making the codebase:

- ✅ **Maintainable** - Clear separation of concerns
- ✅ **Testable** - Business logic isolated from UI
- ✅ **Scalable** - Easy to add new features
- ✅ **Robust** - Comprehensive error handling
- ✅ **Professional** - Industry-standard patterns

The separation of concerns allows developers to work on different layers independently, while the dependency injection system ensures loose coupling between components.

---

*Generated for Flutter Movie App Architecture Presentation* 🚀 