import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/trending_movies/presentation/bloc/trending_bloc.dart';
import 'features/trending_movies/presentation/screens/trending_screen.dart';
import 'injection_container.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<TrendingBloc>(create: (_) => TrendingBloc(sl())..add(const TrendingRequestedEvent())),
      ],
      child: const MaterialApp(home: TrendingScreen()),
    );
  }
}
