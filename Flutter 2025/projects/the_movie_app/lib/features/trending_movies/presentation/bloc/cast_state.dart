part of 'cast_cubit.dart';

class CastState extends Equatable {
  final List<CastMember> cast;
  final bool isLoading;
  final String? error;

  const CastState({required this.cast, required this.isLoading, this.error});

  const CastState.initial() : this(cast: const <CastMember>[], isLoading: false);
  const CastState.loading() : this(cast: const <CastMember>[], isLoading: true);
  const CastState.success(List<CastMember> cast) : this(cast: cast, isLoading: false);
  const CastState.failure(String message) : this(cast: const <CastMember>[], isLoading: false, error: message);

  @override
  List<Object?> get props => <Object?>[cast, isLoading, error];
}
