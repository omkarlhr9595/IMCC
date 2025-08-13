import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/trending_repository.dart';
import '../bloc/trending_bloc.dart';

class TimeWindowSegmented extends StatelessWidget {
  const TimeWindowSegmented({super.key});

  @override
  Widget build(BuildContext context) {
    final TrendingState state = context.select((TrendingBloc b) => b.state);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SegmentedButton<TimeWindow>(
        segments: const <ButtonSegment<TimeWindow>>[
          ButtonSegment<TimeWindow>(value: TimeWindow.day, label: Text('Day')),
          ButtonSegment<TimeWindow>(value: TimeWindow.week, label: Text('Week')),
        ],
        selected: <TimeWindow>{state.timeWindow},
        onSelectionChanged: (Set<TimeWindow> selected) {
          if (selected.isNotEmpty) {
            context.read<TrendingBloc>().add(TrendingTimeWindowChanged(selected.first));
          }
        },
      ),
    );
  }
}

