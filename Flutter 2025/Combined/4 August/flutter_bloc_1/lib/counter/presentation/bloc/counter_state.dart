part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitialState extends CounterState {
  final int count;

  CounterInitialState({required this.count});
}

final class CounterLoadingState extends CounterState {}

final class CounterChangedState extends CounterState {
  final int count;

  CounterChangedState({required this.count});
}
