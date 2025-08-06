import 'package:flutter/material.dart';
import 'package:flutter_bloc_1/counter/presentation/widgets/counter_widget.dart';
import 'package:flutter_bloc_1/counter/presentation/widgets/decrement_counter_widget.dart';
import 'package:flutter_bloc_1/counter/presentation/widgets/increment_counter_widget.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IncrementCounterWidget(),
            SizedBox(height: 20),
            CounterWidget(),
            SizedBox(height: 20),
            DecrementCounterWidget(),
          ],
        ),
      ),
    );
  }
}
