import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/trending_repository.dart';
import '../datasources/local/trending_local_data_source.dart';
import '../datasources/remote/trending_remote_data_source.dart';
import '../models/movie_model.dart';
import '../models/cast_member_model.dart';
import '../../domain/entities/cast_member.dart';

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
      
      // Remove duplicates based on movie ID to prevent Hero tag conflicts
      final Map<int, Movie> uniqueMovies = <int, Movie>{};
      for (final Movie movie in movies) {
        uniqueMovies[movie.id] = movie;
      }
      final List<Movie> deduplicatedMovies = uniqueMovies.values.toList(growable: false);
      
      return Success<List<Movie>>(deduplicatedMovies);
    } on ServerException catch (e) {
      return FailureResult<List<Movie>>(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return FailureResult<List<Movie>>(NetworkFailure(e.message));
    } catch (e) {
      return FailureResult<List<Movie>>(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<CastMember>>> getMovieCast(int movieId) async {
    try {
      final List<CastMemberModel> models = await remoteDataSource.getMovieCast(movieId);
      final List<CastMember> cast = models.map((e) => e.toEntity()).toList(growable: false);
      return Success<List<CastMember>>(cast);
    } on ServerException catch (e) {
      return FailureResult<List<CastMember>>(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return FailureResult<List<CastMember>>(NetworkFailure(e.message));
    } catch (e) {
      return FailureResult<List<CastMember>>(ServerFailure(e.toString()));
    }
  }
}
