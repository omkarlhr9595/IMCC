import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/trending_repository.dart';
import '../datasources/trending_remote_data_source.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  TrendingRepositoryImpl(this.remoteDataSource);

  final TrendingRemoteDataSource remoteDataSource;

  @override
  Future<Result<List<Movie>>> getTrendingMovies(TimeWindow timeWindow) async {
    try {
      final List<Movie> movies = await remoteDataSource.getTrendingMovies(timeWindow);
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

