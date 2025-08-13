import '../../../../core/result/result.dart';
import '../entities/movie.dart';

enum TimeWindow { day, week }

abstract class TrendingRepository {
  Future<Result<List<Movie>>> getTrendingMovies(TimeWindow timeWindow, {required int page, bool forceRefresh = false});
}
