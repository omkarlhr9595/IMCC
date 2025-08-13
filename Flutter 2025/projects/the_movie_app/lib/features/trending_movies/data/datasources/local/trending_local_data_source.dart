import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/repositories/trending_repository.dart';
import '../../models/movie_model.dart';

abstract class TrendingLocalDataSource {
  Future<void> cacheTrendingMovies(
    TimeWindow timeWindow,
    int page,
    List<Map<String, dynamic>> rawMovies,
  );

  Future<List<MovieModel>?> getCachedTrendingMovies(
    TimeWindow timeWindow,
    int page, {
    Duration maxAge,
  });
}

class TrendingLocalDataSourceImpl implements TrendingLocalDataSource {
  static const String _prefix = 'trending_cache_';
  final SharedPreferences prefs;

  TrendingLocalDataSourceImpl(this.prefs);

  String _key(TimeWindow window, int page) => '$_prefix${window.name}_$page';
  String _tsKey(TimeWindow window, int page) => '${_key(window, page)}_ts';

  @override
  Future<void> cacheTrendingMovies(
    TimeWindow timeWindow,
    int page,
    List<Map<String, dynamic>> rawMovies,
  ) async {
    await prefs.setString(_key(timeWindow, page), jsonEncode(rawMovies));
    await prefs.setInt(_tsKey(timeWindow, page), DateTime.now().millisecondsSinceEpoch);
  }

  @override
  Future<List<MovieModel>?> getCachedTrendingMovies(
    TimeWindow timeWindow,
    int page, {
    Duration maxAge = const Duration(minutes: 10),
  }) async {
    final int? ts = prefs.getInt(_tsKey(timeWindow, page));
    if (ts == null) return null;
    final bool fresh = DateTime.now().millisecondsSinceEpoch - ts < maxAge.inMilliseconds;
    if (!fresh) return null;
    final String? raw = prefs.getString(_key(timeWindow, page));
    if (raw == null) return null;
    try {
      final List<dynamic> list = jsonDecode(raw) as List<dynamic>;
      final List<MovieModel> models = list.whereType<Map<String, dynamic>>().map<MovieModel>((Map<String, dynamic> e) => MovieModel.fromJson(e)).toList(growable: false);
      return models;
    } catch (_) {
      return null;
    }
  }
}
