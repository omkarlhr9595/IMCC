import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _count = 0;

  CounterBloc() : super(CounterInitialState(count: 0)) {
    on<CounterIncrementedEvent>(_onCounterIncrementedEvent);
    on<CounterDecrementedEvent>(_onCounterDecrementedEvent);
  }

  FutureOr<void> _onCounterIncrementedEvent(
    CounterIncrementedEvent event,
    Emitter<CounterState> emit,
  ) {
    emit(CounterLoadingState());
    _count++;
    emit(CounterChangedState(count: _count));
  }

  FutureOr<void> _onCounterDecrementedEvent(
    CounterDecrementedEvent event,
    Emitter<CounterState> emit,
  ) {
    emit(CounterLoadingState());
    _count--;
    emit(CounterChangedState(count: _count));
  }
}
