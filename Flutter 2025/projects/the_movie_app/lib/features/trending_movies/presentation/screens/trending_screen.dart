import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/trending_bloc.dart';
import '../widgets/movie_card.dart';
import '../widgets/time_window_segmented.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
        actions: const <Widget>[
          TimeWindowSegmented(),
        ],
      ),
      body: BlocBuilder<TrendingBloc, TrendingState>(
        builder: (BuildContext context, TrendingState state) {
          if (state is TrendingLoading || state is TrendingInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrendingFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(state.message),
              ),
            );
          }
          if (state is TrendingSuccess) {
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.66,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: state.movies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = state.movies[index];
                return MovieCard(movie: movie);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

