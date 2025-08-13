import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/trending_repository.dart';

class GetTrendingMoviesParams {
  final TimeWindow timeWindow;
  final int page;
  final bool forceRefresh;

  const GetTrendingMoviesParams({required this.timeWindow, required this.page, this.forceRefresh = false});
}

class GetTrendingMoviesUseCase implements UseCase<Result<List<Movie>>, GetTrendingMoviesParams> {
  final TrendingRepository repository;

  GetTrendingMoviesUseCase(this.repository);

  @override
  Future<Result<List<Movie>>> call(GetTrendingMoviesParams params) {
    return repository.getTrendingMovies(params.timeWindow, page: params.page, forceRefresh: params.forceRefresh);
  }
}
