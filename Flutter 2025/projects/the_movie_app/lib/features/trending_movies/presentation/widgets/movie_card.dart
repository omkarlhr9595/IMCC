import 'package:flutter/material.dart';

import '../../../../core/config/api_config.dart';
import '../../domain/entities/movie.dart';
import '../screens/trending_movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = movie.posterPath == null ? null : (ApiConfig.imageBaseUrlW500 + movie.posterPath!);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => TrendingMovieDetailScreen(movie: movie)),
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
                          Text((movie.voteAverage ?? 0).toStringAsFixed(1),
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        movie.title,
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

