import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/trending_repository.dart';
import '../../domain/usecases/get_trending_movies.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc(this._getTrendingMovies) : super(const TrendingInitialState(TimeWindow.day)) {
    on<TrendingTimeWindowChangedEvent>(_onTimeWindowChanged);
    on<TrendingRequestedEvent>(_onRequested);
    on<TrendingLoadMoreRequestedEvent>(_onLoadMoreRequested);
    // Cast event is a no-op here intentionally to keep list bloc lean
  }

  final GetTrendingMoviesUseCase _getTrendingMovies;

  Future<void> _onTimeWindowChanged(TrendingTimeWindowChangedEvent event, Emitter<TrendingState> emit) async {
    final TimeWindow newWindow = event.timeWindow;
    emit(_mapToSameStateTypeWithNewWindow(state, newWindow));
    try {
      // 1) Try cache/network (no forced refresh) without flashing a loading state
      final Result<List<Movie>> cachedOrNetwork = await _getTrendingMovies(GetTrendingMoviesParams(timeWindow: newWindow, page: 1));
      cachedOrNetwork.when(
        success: (List<Movie> movies) => emit(TrendingSuccessState(
          movies: movies,
          timeWindow: newWindow,
          hasReachedMax: movies.isEmpty,
          page: 1,
        )),
        failure: (_) {
          // If it fails and we currently had content, keep showing it; otherwise, fall back to loading + hard refresh
          if (state is! TrendingSuccessState) {
            emit(TrendingLoadingState(newWindow));
          }
        },
      );

      // 2) Background hard refresh to ensure freshness (no loading state)
      final Result<List<Movie>> fresh = await _getTrendingMovies(GetTrendingMoviesParams(timeWindow: newWindow, page: 1, forceRefresh: true));
      fresh.when(
        success: (List<Movie> movies) => emit(TrendingSuccessState(
          movies: movies,
          timeWindow: newWindow,
          hasReachedMax: movies.isEmpty,
          page: 1,
        )),
        failure: (_) {},
      );
    } catch (_) {
      // ignore
    }
  }

  Future<void> _onRequested(TrendingRequestedEvent event, Emitter<TrendingState> emit) async {
    emit(TrendingLoadingState(state.timeWindow));
    try {
      final Result<List<Movie>> result = await _getTrendingMovies(GetTrendingMoviesParams(timeWindow: state.timeWindow, page: 1, forceRefresh: true));
      result.when(
        success: (List<Movie> movies) => emit(TrendingSuccessState(movies: movies, timeWindow: state.timeWindow, hasReachedMax: movies.isEmpty, page: 1)),
        failure: (failure) => emit(TrendingFailureState(message: failure.message, timeWindow: state.timeWindow)),
      );
    } catch (e) {
      emit(TrendingFailureState(message: e.toString(), timeWindow: state.timeWindow));
    }
  }

  Future<void> _onLoadMoreRequested(TrendingLoadMoreRequestedEvent event, Emitter<TrendingState> emit) async {
    final TrendingState current = state;
    if (current is! TrendingSuccessState) return;
    if (current.hasReachedMax) return;
    final int nextPage = current.page + 1;
    emit(TrendingSuccessState(
      movies: current.movies,
      timeWindow: current.timeWindow,
      hasReachedMax: current.hasReachedMax,
      page: current.page,
      isLoadingMore: true,
    ));
    try {
      final Result<List<Movie>> result = await _getTrendingMovies(GetTrendingMoviesParams(timeWindow: current.timeWindow, page: nextPage));
      result.when(
        success: (List<Movie> movies) {
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
          
          emit(TrendingSuccessState(
            movies: combined,
            timeWindow: current.timeWindow,
            hasReachedMax: movies.isEmpty,
            page: nextPage,
            isLoadingMore: false,
          ));
        },
        failure: (failure) {
          // Keep current state on failure; optionally could emit failure
          emit(TrendingSuccessState(
            movies: current.movies,
            timeWindow: current.timeWindow,
            hasReachedMax: current.hasReachedMax,
            page: current.page,
            isLoadingMore: false,
          ));
        },
      );
    } catch (_) {
      emit(TrendingSuccessState(
        movies: current.movies,
        timeWindow: current.timeWindow,
        hasReachedMax: current.hasReachedMax,
        page: current.page,
        isLoadingMore: false,
      ));
    }
  }

  TrendingState _mapToSameStateTypeWithNewWindow(TrendingState current, TimeWindow newWindow) {
    if (current is TrendingSuccessState) {
      return TrendingSuccessState(movies: current.movies, timeWindow: newWindow, hasReachedMax: current.hasReachedMax, page: current.page);
    }
    if (current is TrendingFailureState) {
      return TrendingFailureState(message: current.message, timeWindow: newWindow);
    }
    if (current is TrendingLoadingState) {
      return TrendingLoadingState(newWindow);
    }
    return TrendingInitialState(newWindow);
  }
}
