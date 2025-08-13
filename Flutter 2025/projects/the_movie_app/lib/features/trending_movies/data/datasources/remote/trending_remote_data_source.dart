import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../domain/repositories/trending_repository.dart';
import '../../models/movie_model.dart';
import '../../models/cast_member_model.dart';
import '../local/trending_local_data_source.dart';

abstract class TrendingRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies(
    TimeWindow timeWindow, {
    required int page,
  });
  Future<List<CastMemberModel>> getMovieCast(int movieId);
}

class TrendingRemoteDataSourceImpl implements TrendingRemoteDataSource {
  TrendingRemoteDataSourceImpl(this._client, this._local);

  final DioClient _client;
  final TrendingLocalDataSource _local;

  @override
  Future<List<MovieModel>> getTrendingMovies(
    TimeWindow timeWindow, {
    required int page,
  }) async {
    final String path = '/trending/movie/${timeWindow == TimeWindow.day ? 'day' : 'week'}';
    try {
      final Response<dynamic> response = await _client.dio.get(
        path,
        queryParameters: <String, dynamic>{'page': page},
      );
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final List<dynamic> results = (response.data as Map<String, dynamic>)['results'] as List<dynamic>? ?? <dynamic>[];
        final List<Map<String, dynamic>> rawList = results.whereType<Map<String, dynamic>>().toList(growable: false);
        await _local.cacheTrendingMovies(timeWindow, page, rawList);
        final List<MovieModel> models = rawList.map<MovieModel>((Map<String, dynamic> e) => MovieModel.fromJson(e)).toList(growable: false);
        return models;
      }
      throw ServerException(message: 'Unexpected response', statusCode: response.statusCode);
    } on DioException catch (e) {
      _client.throwAsServerException(e);
    }
  }

  @override
  Future<List<CastMemberModel>> getMovieCast(int movieId) async {
    try {
      final response = await _client.dio.get('/movie/$movieId/credits');
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final List<dynamic> results = (response.data as Map<String, dynamic>)['cast'] as List<dynamic>? ?? <dynamic>[];
        return results.whereType<Map<String, dynamic>>().map<CastMemberModel>((e) => CastMemberModel.fromJson(e)).toList(growable: false);
      }
      throw ServerException(message: 'Unexpected response', statusCode: response.statusCode);
    } on DioException catch (e) {
      _client.throwAsServerException(e);
    }
  }
}
