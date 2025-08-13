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
      body: BlocBuilder<TrendingBloc, TrendingState>(
        builder: (BuildContext context, TrendingState state) {
          return CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Currently Trending', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                            TimeWindowSegmented(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is TrendingLoadingState || state is TrendingInitialState)
                const SliverFillRemaining(child: Center(child: CircularProgressIndicator()))
              else if (state is TrendingFailureState)
                SliverFillRemaining(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(state.message),
                    ),
                  ),
                )
              else if (state is TrendingSuccessState)
                SliverPadding(
                  padding: const EdgeInsets.all(12),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => MovieCard(movie: state.movies[index]),
                      childCount: state.movies.length,
                    ),
                  ),
                )
              else
                const SliverToBoxAdapter(child: SizedBox.shrink()),
            ],
          );
        },
      ),
    );
  }
}
