part of 'trending_bloc.dart';

abstract class TrendingEvent extends Equatable {
  const TrendingEvent();
  @override
  List<Object?> get props => <Object?>[];
}

class TrendingRequestedEvent extends TrendingEvent {
  const TrendingRequestedEvent();
}

class TrendingLoadMoreRequestedEvent extends TrendingEvent {
  const TrendingLoadMoreRequestedEvent();
}

class TrendingTimeWindowChangedEvent extends TrendingEvent {
  final TimeWindow timeWindow;
  const TrendingTimeWindowChangedEvent(this.timeWindow);

  @override
  List<Object?> get props => <Object?>[timeWindow];
}

