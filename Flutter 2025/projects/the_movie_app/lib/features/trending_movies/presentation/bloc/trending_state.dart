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
  final bool hasReachedMax;
  final int page;
  final bool isLoadingMore;
  const TrendingSuccessState({required this.movies, required TimeWindow timeWindow, required this.hasReachedMax, required this.page, this.isLoadingMore = false}) : super(timeWindow);

  TrendingSuccessState copyWith({
    List<Movie>? movies,
    bool? hasReachedMax,
    int? page,
    bool? isLoadingMore,
  }) =>
      TrendingSuccessState(
        movies: movies ?? this.movies,
        timeWindow: timeWindow,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        page: page ?? this.page,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      );

  @override
  List<Object?> get props => <Object?>[movies, timeWindow, hasReachedMax, page, isLoadingMore];
}

class TrendingFailureState extends TrendingState {
  final String message;
  const TrendingFailureState({required this.message, required TimeWindow timeWindow}) : super(timeWindow);

  @override
  List<Object?> get props => <Object?>[message, timeWindow];
}
