import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../trending_movies/data/models/movie_model.dart';

abstract class SearchLocalDataSource {
  Future<void> cacheSearchResults(String query, int page, List<Map<String, dynamic>> rawMovies);
  Future<List<MovieModel>?> getCachedSearchResults(String query, int page, {Duration maxAge});
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  static const String _prefix = 'search_cache_';
  final SharedPreferences prefs;
  SearchLocalDataSourceImpl(this.prefs);

  String _key(String query, int page) => '$_prefix${query.trim().toLowerCase()}_$page';
  String _tsKey(String query, int page) => '${_key(query, page)}_ts';

  @override
  Future<void> cacheSearchResults(String query, int page, List<Map<String, dynamic>> rawMovies) async {
    await prefs.setString(_key(query, page), jsonEncode(rawMovies));
    await prefs.setInt(_tsKey(query, page), DateTime.now().millisecondsSinceEpoch);
  }

  @override
  Future<List<MovieModel>?> getCachedSearchResults(String query, int page, {Duration maxAge = const Duration(minutes: 5)}) async {
    final int? ts = prefs.getInt(_tsKey(query, page));
    if (ts == null) return null;
    final bool fresh = DateTime.now().millisecondsSinceEpoch - ts < maxAge.inMilliseconds;
    if (!fresh) return null;
    final String? raw = prefs.getString(_key(query, page));
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
