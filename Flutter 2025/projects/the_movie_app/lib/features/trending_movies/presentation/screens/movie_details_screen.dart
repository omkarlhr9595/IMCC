import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/cast_member.dart';
import '../bloc/cast_cubit.dart';

import '../../../../core/config/api_config.dart';
import '../../domain/entities/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = 'MovieDetailsScreen';

  const MovieDetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final String? backdrop = movie.backdropPath == null ? null : (ApiConfig.imageBaseUrlOriginal + movie.backdropPath!);
    final String? poster = movie.posterPath == null ? null : (ApiConfig.imageBaseUrlW500 + movie.posterPath!);
    context.read<CastCubit>().load(movie.id);
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
                            tag: 'poster_${movie.id}_${movie.hashCode}',
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                  opaque: false,
                                  barrierDismissible: true,
                                  barrierColor: Colors.black54,
                                  pageBuilder: (ctx, _, __) {
                                    final Size size = MediaQuery.of(ctx).size;
                                    final double maxW = size.width * 0.9;
                                    final double maxH = size.height * 0.9;
                                    return GestureDetector(
                                      onTap: () => Navigator.of(ctx).pop(),
                                      onVerticalDragEnd: (DragEndDetails details) {
                                        final double? velocity = details.primaryVelocity;
                                        if (velocity != null && velocity > 250) {
                                          Navigator.of(ctx).pop();
                                        }
                                      },
                                      child: Center(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: maxW,
                                            maxHeight: maxH,
                                          ),
                                          child: Hero(
                                            tag: 'poster_${movie.id}_${movie.hashCode}',
                                            child: InteractiveViewer(
                                              minScale: 0.5,
                                              maxScale: 5,
                                              child: CachedNetworkImage(
                                                imageUrl: poster,
                                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                                errorWidget: (context, url, error) => const Center(child: Icon(Icons.broken_image_outlined, color: Colors.white)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ));
                              },
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
                BlocBuilder<CastCubit, CastState>(
                  builder: (BuildContext context, CastState castState) {
                    if (castState.isLoading) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final List<CastMember> cast = castState.cast;
                    if (cast.isEmpty) return const SizedBox.shrink();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Text('Top Cast', style: Theme.of(context).textTheme.titleMedium),
                        ),
                        SizedBox(
                          height: 210,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: cast.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 12),
                            itemBuilder: (BuildContext context, int index) {
                              final CastMember person = cast[index];
                              final String? profilePath = person.profilePath;
                              final String name = person.name;
                              final String character = person.character;
                              final String? profileUrl = profilePath == null ? null : (ApiConfig.imageBaseUrlW500 + profilePath);
                              return SizedBox(
                                width: 110,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 150,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: profileUrl == null
                                            ? Container(color: Colors.black12)
                                            : CachedNetworkImage(
                                                imageUrl: profileUrl,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                                                errorWidget: (context, url, error) => const Center(child: Icon(Icons.person_off_outlined)),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      character,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

