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
  }

  final GetTrendingMoviesUseCase _getTrendingMovies;

  Future<void> _onTimeWindowChanged(TrendingTimeWindowChangedEvent event, Emitter<TrendingState> emit) async {
    final TimeWindow newWindow = event.timeWindow;
    emit(_mapToSameStateTypeWithNewWindow(state, newWindow));
    add(const TrendingRequestedEvent());
  }

  Future<void> _onRequested(TrendingRequestedEvent event, Emitter<TrendingState> emit) async {
    emit(TrendingLoadingState(state.timeWindow));
    try {
      final Result<List<Movie>> result = await _getTrendingMovies(GetTrendingMoviesParams(timeWindow: state.timeWindow));
      result.when(
        success: (List<Movie> movies) => emit(TrendingSuccessState(movies: movies, timeWindow: state.timeWindow)),
        failure: (failure) => emit(TrendingFailureState(message: failure.message, timeWindow: state.timeWindow)),
      );
    } catch (e) {
      emit(TrendingFailureState(message: e.toString(), timeWindow: state.timeWindow));
    }
  }

  TrendingState _mapToSameStateTypeWithNewWindow(TrendingState current, TimeWindow newWindow) {
    if (current is TrendingSuccessState) {
      return TrendingSuccessState(movies: current.movies, timeWindow: newWindow);
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

