import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/trending_repository.dart';
import '../bloc/trending_bloc.dart';

class TimeWindowSegmented extends StatelessWidget {
  const TimeWindowSegmented({super.key});

  static const List<ButtonSegment<TimeWindow>> _segments = <ButtonSegment<TimeWindow>>[
    ButtonSegment<TimeWindow>(value: TimeWindow.day, label: Text('Day')),
    ButtonSegment<TimeWindow>(value: TimeWindow.week, label: Text('Week')),
  ];

  @override
  Widget build(BuildContext context) {
    final trandingBloc = context.read<TrendingBloc>();

    return BlocSelector<TrendingBloc, TrendingState, TimeWindow>(
      selector: (TrendingState s) => s.timeWindow,
      builder: (BuildContext context, TimeWindow selected) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SegmentedButton<TimeWindow>(
            segments: _segments,
            selected: <TimeWindow>{selected},
            onSelectionChanged: (Set<TimeWindow> set) {
              if (set.isEmpty) return;
              final TimeWindow choice = set.first;
              if (choice == selected) return;
              trandingBloc.add(TrendingTimeWindowChangedEvent(choice));
            },
          ),
        );
      },
    );
  }
}
