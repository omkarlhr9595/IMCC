import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../trending_movies/data/models/movie_model.dart';
import '../local/search_local_data_source.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieModel>> searchMovies({required String query, required int page});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl(this._client, this._local);

  final DioClient _client;
  final SearchLocalDataSource _local;

  @override
  Future<List<MovieModel>> searchMovies({required String query, required int page}) async {
    const String path = '/search/movie';
    try {
      final Response<dynamic> response = await _client.dio.get(
        path,
        queryParameters: <String, dynamic>{
          'query': query,
          'page': page,
          'include_adult': false,
        },
      );
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final List<dynamic> results = (response.data as Map<String, dynamic>)['results'] as List<dynamic>? ?? <dynamic>[];
        final List<Map<String, dynamic>> rawList = results.whereType<Map<String, dynamic>>().toList(growable: false);
        await _local.cacheSearchResults(query, page, rawList);
        final List<MovieModel> models = rawList.map<MovieModel>((Map<String, dynamic> e) => MovieModel.fromJson(e)).toList(growable: false);
        return models;
      }
      throw ServerException(message: 'Unexpected response', statusCode: response.statusCode);
    } on DioException catch (e) {
      _client.throwAsServerException(e);
    }
  }
}
