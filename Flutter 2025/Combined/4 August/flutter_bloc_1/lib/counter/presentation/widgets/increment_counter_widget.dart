import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/counter/presentation/bloc/counter_bloc.dart';

class IncrementCounterWidget extends StatelessWidget {
  const IncrementCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return ElevatedButton(
      onPressed: () {
        counterBloc.add(CounterIncrementedEvent());
      },
      child: const Icon(Icons.add),
    );
  }
}
