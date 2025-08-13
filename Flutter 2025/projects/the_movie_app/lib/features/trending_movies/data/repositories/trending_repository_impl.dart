import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/trending_repository.dart';
import '../datasources/local/trending_local_data_source.dart';
import '../datasources/remote/trending_remote_data_source.dart';
import '../models/movie_model.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  TrendingRepositoryImpl(this.remoteDataSource, this.localDataSource);

  final TrendingRemoteDataSource remoteDataSource;
  final TrendingLocalDataSource localDataSource;

  @override
  Future<Result<List<Movie>>> getTrendingMovies(TimeWindow timeWindow, {required int page, bool forceRefresh = false}) async {
    try {
      final List<MovieModel>? cached = forceRefresh ? null : await localDataSource.getCachedTrendingMovies(timeWindow, page);
      final List<MovieModel> models = cached ?? await remoteDataSource.getTrendingMovies(timeWindow, page: page);
      final List<Movie> movies = models.map((MovieModel m) => m.toEntity()).toList(growable: false);
      return Success<List<Movie>>(movies);
    } on ServerException catch (e) {
      return FailureResult<List<Movie>>(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return FailureResult<List<Movie>>(NetworkFailure(e.message));
    } catch (e) {
      return FailureResult<List<Movie>>(ServerFailure(e.toString()));
    }
  }
}
