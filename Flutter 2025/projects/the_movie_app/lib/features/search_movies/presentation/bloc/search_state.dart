part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object?> get props => <Object?>[];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  final String query;
  const SearchLoading(this.query);
  @override
  List<Object?> get props => <Object?>[query];
}

class SearchFailure extends SearchState {
  final String query;
  final String message;
  const SearchFailure({required this.query, required this.message});
  @override
  List<Object?> get props => <Object?>[query, message];
}

class SearchSuccess extends SearchState {
  final String query;
  final List<Movie> movies;
  final int page;
  final bool hasReachedMax;
  final bool isLoadingMore;
  const SearchSuccess({required this.query, required this.movies, required this.page, required this.hasReachedMax, this.isLoadingMore = false});

  SearchSuccess copyWith({
    List<Movie>? movies,
    int? page,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return SearchSuccess(
      query: query,
      movies: movies ?? this.movies,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => <Object?>[query, movies, page, hasReachedMax, isLoadingMore];
}
