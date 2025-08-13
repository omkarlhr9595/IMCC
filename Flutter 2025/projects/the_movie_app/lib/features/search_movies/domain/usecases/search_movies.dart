import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../trending_movies/domain/entities/movie.dart';
import '../repositories/search_repository.dart';

class SearchMoviesParams {
  final String query;
  final int page;
  final bool forceRefresh;

  const SearchMoviesParams({required this.query, required this.page, this.forceRefresh = false});
}

class SearchMoviesUseCase implements UseCase<Result<List<Movie>>, SearchMoviesParams> {
  final SearchRepository repository;
  SearchMoviesUseCase(this.repository);

  @override
  Future<Result<List<Movie>>> call(SearchMoviesParams params) {
    return repository.searchMovies(query: params.query, page: params.page, forceRefresh: params.forceRefresh);
  }
}
