the_movie_app — Clean Architecture Flutter (TMDB)

Overview

This app demonstrates a production-ready Clean Architecture for a movies client using TMDB. It separates concerns into independent layers (presentation, domain, data) with a small core module for shared primitives. State management uses BLoC, networking uses Dio, DI via GetIt, and models are parsed with json_serializable.

Key principles

- Dependency rule: inner layers know nothing about outer layers
  - presentation → domain → core
  - data → domain → core (data depends on domain, not vice‑versa)
- Stable abstractions on the inside (entities, use cases, repositories)
- Frameworks (Flutter/Dio) isolated at the edges (presentation/data)
- Testable units: BLoC, use cases, repositories, data sources

Packages

- flutter_bloc: BLoC for presentation
- get_it: DI container
- dio: HTTP client
- json_annotation/json_serializable/build_runner: model codegen
- equatable: value equality
- google_fonts: typography (Material 3)

Project structure

lib/
  app.dart                      → Root widget, theme, top-level MultiBlocProvider
  main.dart                     → Bootstraps DI and runs App
  injection_container.dart      → DI registrations (GetIt)
  core/
    config/api_config.dart      → API base URLs and API key
    error/
      exceptions.dart           → Low-level exceptions thrown by data layer
      failures.dart             → Domain-level Failure value objects
    network/dio_client.dart     → Configured Dio instance
    result/result.dart          → Result<T> (Success/FailureResult)
    usecases/usecase.dart       → UseCase base class and NoParams
  features/
    trending_movies/
      domain/
        entities/movie.dart     → Pure domain entity (Equatable)
        repositories/trending_repository.dart → Repository interface + TimeWindow enum
        usecases/get_trending_movies.dart     → Use case returning Result<List<Movie>>
      data/
        models/movie_model.dart → json_serializable MovieModel + toEntity()
        datasources/trending_remote_data_source.dart → Dio calls, returns models
        repositories/trending_repository_impl.dart   → Maps exceptions→Failure and models→entities
      presentation/
        bloc/
          trending_bloc.dart    → BLoC wiring events→states via use case
          trending_event.dart    → Events: TrendingRequestedEvent, TrendingTimeWindowChangedEvent
          trending_state.dart    → States: Initial/Loading/Success/Failure (with timeWindow)
        screens/
          trending_screen.dart   → Header (title/subtitle/segmented) + SliverGrid
          trending_movie_detail_screen.dart → SliverAppBar hero detail page
        widgets/
          time_window_segmented.dart → BlocSelector-based segmented control
          movie_card.dart        → Poster card with rating overlay and Hero to detail

Layer responsibilities

- Presentation (Flutter only)
  - BLoC: translates UI intent into use case calls, emits typed states
  - Widgets/Screens: render states
  - No direct networking or storage

- Domain (pure Dart)
  - Entities: Movie
  - Use cases: business actions with explicit inputs/outputs
  - Repository interfaces: stable contracts for data access
  - Uses Result<Success/Failure> to avoid throwing across boundaries

- Data (framework-facing)
  - Data sources: integrate with Dio and map server JSON to models
  - Models: json_serializable data classes with toEntity()
  - Repository implementations: orchestrate sources, map exceptions→Failure

Error handling

- Data layer throws Exceptions (e.g., ServerException), caught in repository
- Repository maps to Failure via Result<T> (FailureResult)
- BLoC consumes Result and emits Failure state with messages

Networking

- `core/network/dio_client.dart` configures base URL, timeouts, and default query param `api_key`
- Replace your TMDB API key in `core/config/api_config.dart`

UI & Theme

- Material 3 + Google Fonts (Inter)
- TrendingScreen with header and segmented control (Day/Week)
- Grid of poster cards with rating overlay and Hero transitions to detail screen

Clean Architecture audit (current code)

- Domain does not depend on data or Flutter — OK
- Data depends on domain interfaces and converts models→entities — OK
- Presentation depends on domain/use cases + DI — OK
- Result/Failure used across repositories/use cases/BLoC — OK
- json_serializable used only in data models — OK
- DI only registers infrastructure (client, data source, repo, use case); BLoC is created in UI — OK

Suggested improvements (optional)

- Secrets: move API key to secure storage or runtime config (env) per flavor
- Add repository+use case unit tests; widget tests for BLoC/UI mapping
- Add caching layer (e.g., Hive/Sqflite) under data for offline
- Introduce a common Result extension for mapping in BLoC
- Extract UI constants (paddings, shapes) and add shimmer placeholders

Setup

1) Set TMDB key
   - Edit `core/config/api_config.dart` → `tmdbApiKey`

2) Generate JSON code
   - dart run build_runner build -d

3) Run app
   - flutter run

Add a new feature (recipe)

1) domain: create entity, repository interface, use cases
2) data: create model (+g.dart), remote/local data sources, repository impl
3) presentation: create bloc (events/states), screens, widgets
4) DI: register data sources, repository, use cases
5) UI: provide bloc via BlocProvider (or MultiBlocProvider in `app.dart`)

