import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/trending_repository.dart';
import '../models/movie_model.dart';

abstract class TrendingRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies(TimeWindow timeWindow);
}

class TrendingRemoteDataSourceImpl implements TrendingRemoteDataSource {
  TrendingRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<List<MovieModel>> getTrendingMovies(TimeWindow timeWindow) async {
    final String path = '/trending/movie/${timeWindow == TimeWindow.day ? 'day' : 'week'}';
    try {
      final Response<dynamic> response = await _client.dio.get(path);
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final List<dynamic> results = (response.data as Map<String, dynamic>)['results'] as List<dynamic>; 
        final List<MovieModel> models = results.map((e) => MovieModel.fromJson(e)).toList();
        
        return models;
      }
      throw ServerException(message: 'Unexpected response', statusCode: response.statusCode);
    } on DioException catch (e) {
      _client.throwAsServerException(e);
    }
  }
}

