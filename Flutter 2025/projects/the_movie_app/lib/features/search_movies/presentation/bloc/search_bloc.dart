import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../trending_movies/domain/entities/movie.dart';
import '../../domain/usecases/search_movies.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._searchMovies) : super(const SearchInitial()) {
    on<SearchQueryChanged>(_onQueryChanged);
    on<SearchRequested>(_onRequested);
    on<SearchLoadMoreRequested>(_onLoadMoreRequested);
    on<SearchCleared>(_onCleared);
  }

  final SearchMoviesUseCase _searchMovies;

  Future<void> _onCleared(SearchCleared event, Emitter<SearchState> emit) async {
    emit(const SearchInitial());
  }

  Future<void> _onQueryChanged(SearchQueryChanged event, Emitter<SearchState> emit) async {
    final String query = event.query.trim();
    if (query.isEmpty) {
      emit(const SearchInitial());
      return;
    }
    emit(SearchLoading(query));
    add(SearchRequested(query));
  }

  Future<void> _onRequested(SearchRequested event, Emitter<SearchState> emit) async {
    try {
      final result = await _searchMovies(SearchMoviesParams(query: event.query, page: 1));
      result.when(
        success: (movies) => emit(SearchSuccess(query: event.query, movies: movies, page: 1, hasReachedMax: movies.isEmpty)),
        failure: (f) => emit(SearchFailure(query: event.query, message: f.message)),
      );
    } catch (e) {
      emit(SearchFailure(query: event.query, message: e.toString()));
    }
  }

  Future<void> _onLoadMoreRequested(SearchLoadMoreRequested event, Emitter<SearchState> emit) async {
    final current = state;
    if (current is! SearchSuccess || current.hasReachedMax || current.isLoadingMore) return;
    final nextPage = current.page + 1;
    emit(current.copyWith(isLoadingMore: true));
    try {
      final result = await _searchMovies(SearchMoviesParams(query: current.query, page: nextPage));
      result.when(
        success: (movies) {
          // Combine movies and remove duplicates to prevent Hero tag conflicts
          final Map<int, Movie> uniqueMovies = <int, Movie>{};
          
          // Add current movies first (preserving order)
          for (final Movie movie in current.movies) {
            uniqueMovies[movie.id] = movie;
          }
          
          // Add new movies (newer ones will override if same ID)
          for (final Movie movie in movies) {
            uniqueMovies[movie.id] = movie;
          }
          
          final List<Movie> combined = uniqueMovies.values.toList(growable: false);
          
          emit(current.copyWith(
            movies: combined,
            page: nextPage,
            hasReachedMax: movies.isEmpty,
            isLoadingMore: false,
          ));
        },
        failure: (_) => emit(current.copyWith(isLoadingMore: false)),
      );
    } catch (_) {
      emit(current.copyWith(isLoadingMore: false));
    }
  }
}
