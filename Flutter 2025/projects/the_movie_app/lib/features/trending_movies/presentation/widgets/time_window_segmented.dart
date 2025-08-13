import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/trending_repository.dart';
import '../bloc/trending_bloc.dart';

class TimeWindowSegmented extends StatelessWidget {
  const TimeWindowSegmented({super.key});

  static final List<ButtonSegment<TimeWindow>> _segments = <ButtonSegment<TimeWindow>>[
    const ButtonSegment<TimeWindow>(
      value: TimeWindow.day,
      label: Text('Day', softWrap: false, maxLines: 1),
    ),
    const ButtonSegment<TimeWindow>(
      value: TimeWindow.week,
      label: Text('Week', softWrap: false, maxLines: 1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final trandingBloc = context.read<TrendingBloc>();

    return BlocSelector<TrendingBloc, TrendingState, TimeWindow>(
      selector: (TrendingState s) => s.timeWindow,
      builder: (BuildContext context, TimeWindow selected) {
        return SegmentedButton<TimeWindow>(
          segments: _segments,
          selected: <TimeWindow>{selected},
          showSelectedIcon: false,
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            ),
            minimumSize: WidgetStatePropertyAll<Size>(Size(0, 40)),
            visualDensity: VisualDensity(horizontal: -1, vertical: -2),
          ),
          onSelectionChanged: (Set<TimeWindow> set) {
            if (set.isEmpty) return;
            final TimeWindow choice = set.first;
            if (choice == selected) return;
            trandingBloc.add(TrendingTimeWindowChangedEvent(choice));
          },
        );
      },
    );
  }
}
