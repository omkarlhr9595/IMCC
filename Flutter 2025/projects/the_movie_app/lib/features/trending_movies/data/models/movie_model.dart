import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable(createToJson: false)
class MovieModel {
  const MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
  });

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(readValue: _readTitle)
  final String title;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(readValue: _readReleaseDate)
  final String? releaseDate;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  static Object? _readTitle(Map json, String key) => (json['title'] ?? json['name'] ?? '').toString();

  static Object? _readReleaseDate(Map json, String key) =>
      (json['release_date'] ?? json['first_air_date'])?.toString();

  Movie toEntity() => Movie(
        id: id,
        title: title,
        overview: overview,
        posterPath: posterPath,
        backdropPath: backdropPath,
        releaseDate: releaseDate,
        voteAverage: voteAverage,
      );
}

