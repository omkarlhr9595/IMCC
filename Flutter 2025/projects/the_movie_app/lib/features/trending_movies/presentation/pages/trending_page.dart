import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/api_config.dart';
import '../../../../injection_container.dart';
import '../../domain/repositories/trending_repository.dart';
import '../bloc/trending_bloc.dart';
import 'trending_movie_detail_page.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrendingBloc>(
      create: (_) => TrendingBloc(sl())..add(const TrendingRequested()),
      child: const _TrendingView(),
    );
  }
}

class _TrendingView extends StatelessWidget {
  const _TrendingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
        actions: <Widget>[
          _TimeWindowSegmentedControl(),
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
                return _MovieCard(movie: movie);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _TimeWindowSegmentedControl extends StatelessWidget {
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

class _MovieCard extends StatelessWidget {
  const _MovieCard({required this.movie});

  final dynamic movie; // using dynamic to avoid import cycle in this snippet

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = movie.posterPath == null ? null : (ApiConfig.imageBaseUrlW500 + movie.posterPath!);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => TrendingMovieDetailPage(movie: movie)),
          ),
          child: Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 2 / 3,
                child: imageUrl == null
                    ? Container(color: Colors.grey.shade300)
                    : Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? progress) {
                          if (progress == null) return child;
                          final double? value = (progress.expectedTotalBytes != null)
                              ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                              : null;
                          return Center(child: CircularProgressIndicator(value: value));
                        },
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return Container(
                            color: Colors.grey.shade300,
                            alignment: Alignment.center,
                            child: const Icon(Icons.broken_image_outlined),
                          );
                        },
                      ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[Color(0xCC000000), Color(0x00000000)],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          Text((movie.voteAverage as double?)?.toStringAsFixed(1) ?? '--',
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        movie.title as String,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

