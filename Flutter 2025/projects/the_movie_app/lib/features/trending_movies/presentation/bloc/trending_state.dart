part of 'trending_bloc.dart';

abstract class TrendingState extends Equatable {
  final TimeWindow timeWindow;
  const TrendingState(this.timeWindow);

  @override
  List<Object?> get props => <Object?>[timeWindow];
}

class TrendingInitial extends TrendingState {
  const TrendingInitial(super.timeWindow);
}

class TrendingLoading extends TrendingState {
  const TrendingLoading(super.timeWindow);
}

class TrendingSuccess extends TrendingState {
  final List<Movie> movies;
  const TrendingSuccess({required this.movies, required TimeWindow timeWindow}) : super(timeWindow);

  @override
  List<Object?> get props => <Object?>[movies, timeWindow];
}

class TrendingFailure extends TrendingState {
  final String message;
  const TrendingFailure({required this.message, required TimeWindow timeWindow}) : super(timeWindow);

  @override
  List<Object?> get props => <Object?>[message, timeWindow];
}
