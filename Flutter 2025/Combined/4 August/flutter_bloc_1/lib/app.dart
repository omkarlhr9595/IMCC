import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter_bloc_1/counter/presentation/screens/counter_screen.dart';

class MyCounterApp extends StatefulWidget {
  const MyCounterApp({super.key});

  @override
  State<MyCounterApp> createState() => _MyCounterAppState();
}

class _MyCounterAppState extends State<MyCounterApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const CounterScreen(),
    );
  }
}
