import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/config/api_config.dart';
import '../../domain/entities/movie.dart';

class TrendingMovieDetailScreen extends StatelessWidget {
  const TrendingMovieDetailScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final String? backdrop = movie.backdropPath == null ? null : (ApiConfig.imageBaseUrlOriginal + movie.backdropPath!);
    final String? poster = movie.posterPath == null ? null : (ApiConfig.imageBaseUrlW500 + movie.posterPath!);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 360,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  if (backdrop != null)
                    CachedNetworkImage(
                      imageUrl: backdrop,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Container(color: Colors.black12),
                    )
                  else
                    Container(color: Colors.black12),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0, .5),
                        end: Alignment(0, 1),
                        colors: <Color>[Colors.transparent, Colors.black54],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (poster != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Hero(
                            tag: 'poster_${movie.id}',
                            child: CachedNetworkImage(
                              imageUrl: poster,
                              width: 120,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const SizedBox(
                                width: 120,
                                height: 180,
                                child: Center(child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) => const SizedBox(
                                width: 120,
                                height: 180,
                                child: Center(child: Icon(Icons.broken_image_outlined)),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(movie.title, style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 8),
                            Row(children: <Widget>[
                              const Icon(Icons.star_rounded, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text((movie.voteAverage ?? 0).toStringAsFixed(1)),
                            ]),
                            if (movie.releaseDate != null) ...<Widget>[
                              const SizedBox(height: 8),
                              Text('Release: ${movie.releaseDate!}'),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Overview', style: Theme.of(context).textTheme.titleMedium),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(movie.overview),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
