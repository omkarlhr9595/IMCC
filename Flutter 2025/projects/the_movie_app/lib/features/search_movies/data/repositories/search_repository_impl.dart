import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/result/result.dart';
import '../../../trending_movies/data/models/movie_model.dart';
import '../../../trending_movies/domain/entities/movie.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/local/search_local_data_source.dart';
import '../datasources/remote/search_remote_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(this.remote, this.local);

  final SearchRemoteDataSource remote;
  final SearchLocalDataSource local;

  @override
  Future<Result<List<Movie>>> searchMovies({required String query, required int page, bool forceRefresh = false}) async {
    try {
      final List<MovieModel>? cached = forceRefresh ? null : await local.getCachedSearchResults(query, page);
      final List<MovieModel> models = cached ?? await remote.searchMovies(query: query, page: page);
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
