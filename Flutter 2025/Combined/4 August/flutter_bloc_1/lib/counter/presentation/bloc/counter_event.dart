part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncrementedEvent extends CounterEvent {
  CounterIncrementedEvent();
}

class CounterDecrementedEvent extends CounterEvent {
  CounterDecrementedEvent();
}
