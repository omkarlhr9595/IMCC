import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

import '../bloc/trending_bloc.dart';
import '../widgets/movie_card.dart';
import '../widgets/time_window_segmented.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TrendingBloc, TrendingState>(
        builder: (BuildContext context, TrendingState state) {
          return RefreshIndicator(
            onRefresh: () async {
              final TrendingBloc bloc = context.read<TrendingBloc>();
              bloc.add(const TrendingRequestedEvent());
              await bloc.stream.firstWhere((TrendingState s) => s is! TrendingLoadingState);
            },
            child: () {
              Widget body;
              if (state is TrendingLoadingState || state is TrendingInitialState) {
                body = const Center(child: CircularProgressIndicator());
              } else if (state is TrendingFailureState) {
                body = Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(state.message),
                  ),
                );
              } else if (state is TrendingSuccessState) {
                body = Column(
                  children: <Widget>[
                    const SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Currently Trending', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                            TimeWindowSegmented(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Scrollbar(
                          controller: _scrollController,
                          thumbVisibility: true,
                          interactive: true,
                          child: InfiniteList(
                            itemCount: (state.movies.length / 2).ceil(),
                            isLoading: state.isLoadingMore,
                            hasReachedMax: state.hasReachedMax,
                            onFetchData: () => context.read<TrendingBloc>().add(const TrendingLoadMoreRequestedEvent()),
                            loadingBuilder: (context) => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            scrollController: _scrollController,
                            itemBuilder: (BuildContext context, int rowIndex) {
                              final int leftIndex = rowIndex * 2;
                              final int rightIndex = leftIndex + 1;
                              return Row(
                                children: <Widget>[
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 0.70,
                                      child: MovieCard(movie: state.movies[leftIndex]),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  if (rightIndex < state.movies.length)
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 0.70,
                                        child: MovieCard(movie: state.movies[rightIndex]),
                                      ),
                                    )
                                  else
                                    const Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 0.70,
                                        child: SizedBox.shrink(),
                                      ),
                                    ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(height: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                body = const SizedBox.shrink();
              }
              return body;
            }(),
          );
        },
      ),
    );
  }
}
