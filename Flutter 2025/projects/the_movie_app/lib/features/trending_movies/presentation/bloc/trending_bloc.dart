import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/trending_repository.dart';
import '../../domain/usecases/get_trending_movies.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc(this._getTrendingMovies) : super(const TrendingInitial(TimeWindow.day)) {
    on<TrendingTimeWindowChanged>(_onTimeWindowChanged);
    on<TrendingRequested>(_onRequested);
  }

  final GetTrendingMoviesUseCase _getTrendingMovies;

  Future<void> _onTimeWindowChanged(TrendingTimeWindowChanged event, Emitter<TrendingState> emit) async {
    final TimeWindow newWindow = event.timeWindow;
    emit(_mapToSameStateTypeWithNewWindow(state, newWindow));
    add(const TrendingRequested());
  }

  Future<void> _onRequested(TrendingRequested event, Emitter<TrendingState> emit) async {
    emit(TrendingLoading(state.timeWindow));
    try {
      final Result<List<Movie>> result = await _getTrendingMovies(GetTrendingMoviesParams(timeWindow: state.timeWindow));
      result.when(
        success: (List<Movie> movies) => emit(TrendingSuccess(movies: movies, timeWindow: state.timeWindow)),
        failure: (failure) => emit(TrendingFailure(message: failure.message, timeWindow: state.timeWindow)),
      );
    } catch (e) {
      emit(TrendingFailure(message: e.toString(), timeWindow: state.timeWindow));
    }
  }

  TrendingState _mapToSameStateTypeWithNewWindow(TrendingState current, TimeWindow newWindow) {
    if (current is TrendingSuccess) {
      return TrendingSuccess(movies: current.movies, timeWindow: newWindow);
    }
    if (current is TrendingFailure) {
      return TrendingFailure(message: current.message, timeWindow: newWindow);
    }
    if (current is TrendingLoading) {
      return TrendingLoading(newWindow);
    }
    return TrendingInitial(newWindow);
  }
}

