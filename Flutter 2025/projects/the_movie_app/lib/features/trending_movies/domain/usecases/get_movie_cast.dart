import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cast_member.dart';
import '../repositories/trending_repository.dart';

class GetMovieCastParams {
  final int movieId;
  const GetMovieCastParams(this.movieId);
}

class GetMovieCastUseCase implements UseCase<Result<List<CastMember>>, GetMovieCastParams> {
  final TrendingRepository repository;
  GetMovieCastUseCase(this.repository);

  @override
  Future<Result<List<CastMember>>> call(GetMovieCastParams params) {
    return repository.getMovieCast(params.movieId);
  }
}
