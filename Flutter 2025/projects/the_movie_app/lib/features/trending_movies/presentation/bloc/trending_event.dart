part of 'trending_bloc.dart';

abstract class TrendingEvent extends Equatable {
  const TrendingEvent();
  @override
  List<Object?> get props => <Object?>[];
}

class TrendingRequested extends TrendingEvent {
  const TrendingRequested();
}

class TrendingTimeWindowChanged extends TrendingEvent {
  final TimeWindow timeWindow;
  const TrendingTimeWindowChanged(this.timeWindow);

  @override
  List<Object?> get props => <Object?>[timeWindow];
}

