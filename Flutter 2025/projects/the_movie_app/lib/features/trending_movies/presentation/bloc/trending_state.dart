part of 'trending_bloc.dart';

abstract class TrendingState extends Equatable {
  final TimeWindow timeWindow;
  const TrendingState(this.timeWindow);

  @override
  List<Object?> get props => <Object?>[timeWindow];
}

class TrendingInitialState extends TrendingState {
  const TrendingInitialState(super.timeWindow);
}

class TrendingLoadingState extends TrendingState {
  const TrendingLoadingState(super.timeWindow);
}

class TrendingSuccessState extends TrendingState {
  final List<Movie> movies;
  const TrendingSuccessState({required this.movies, required TimeWindow timeWindow}) : super(timeWindow);

  @override
  List<Object?> get props => <Object?>[movies, timeWindow];
}

class TrendingFailureState extends TrendingState {
  final String message;
  const TrendingFailureState({required this.message, required TimeWindow timeWindow}) : super(timeWindow);

  @override
  List<Object?> get props => <Object?>[message, timeWindow];
}
