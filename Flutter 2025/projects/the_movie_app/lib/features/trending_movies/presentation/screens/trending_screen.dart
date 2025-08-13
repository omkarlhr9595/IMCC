import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

import '../bloc/trending_bloc.dart';
import '../widgets/movie_card.dart';
import '../widgets/time_window_segmented.dart';
import '../../../search_movies/presentation/bloc/search_bloc.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  late final ScrollController _scrollController;
  final TextEditingController _searchController = TextEditingController();
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
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
              final String q = _searchController.text.trim();
              if (q.isEmpty) {
                final TrendingBloc bloc = context.read<TrendingBloc>();
                bloc.add(const TrendingRequestedEvent());
                await bloc.stream.firstWhere((TrendingState s) => s is! TrendingLoadingState);
              } else {
                final SearchBloc sbloc = context.read<SearchBloc>();
                sbloc.add(SearchRequested(q));
                await sbloc.stream.firstWhere((SearchState s) => s is! SearchLoading);
              }
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
                    SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: _searchController,
                              onChanged: (String value) {
                                _searchDebounce?.cancel();
                                _searchDebounce = Timer(const Duration(milliseconds: 400), () {
                                  final String q = value.trim();
                                  if (q.isEmpty) {
                                    context.read<SearchBloc>().add(const SearchCleared());
                                  } else {
                                    context.read<SearchBloc>().add(SearchQueryChanged(q));
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Search movies...',
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: _searchController.text.trim().isEmpty
                                    ? null
                                    : IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () {
                                          _searchController.clear();
                                          context.read<SearchBloc>().add(const SearchCleared());
                                          if (_scrollController.hasClients) {
                                            _scrollController.jumpTo(0);
                                          }
                                          FocusScope.of(context).unfocus();
                                        },
                                      ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    _searchController.text.trim().isEmpty ? 'Currently Trending' : 'Search Results',
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                if (_searchController.text.trim().isEmpty)
                                  Flexible(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(maxWidth: 280),
                                        child: const TimeWindowSegmented(),
                                      ),
                                    ),
                                  )
                                else
                                  const SizedBox.shrink(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: BlocBuilder<SearchBloc, SearchState>(
                          builder: (BuildContext context, SearchState s) {
                            final String q = _searchController.text.trim();
                            if (q.isEmpty) {
                              return Scrollbar(
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
                              );
                            }
                            if (s is SearchInitial || s is SearchLoading) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            if (s is SearchFailure) {
                              return Center(child: Text(s.message));
                            }
                            if (s is SearchSuccess) {
                              if (s.movies.isEmpty) {
                                return const Center(child: Text('No results'));
                              }
                              return Scrollbar(
                                controller: _scrollController,
                                thumbVisibility: true,
                                interactive: true,
                                child: InfiniteList(
                                  itemCount: (s.movies.length / 2).ceil(),
                                  isLoading: s.isLoadingMore,
                                  hasReachedMax: s.hasReachedMax,
                                  onFetchData: () => context.read<SearchBloc>().add(const SearchLoadMoreRequested()),
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
                                            child: MovieCard(movie: s.movies[leftIndex]),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        if (rightIndex < s.movies.length)
                                          Expanded(
                                            child: AspectRatio(
                                              aspectRatio: 0.70,
                                              child: MovieCard(movie: s.movies[rightIndex]),
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
                              );
                            }
                            return const SizedBox.shrink();
                          },
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
