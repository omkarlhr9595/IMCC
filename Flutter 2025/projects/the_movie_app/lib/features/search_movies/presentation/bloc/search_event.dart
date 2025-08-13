part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => <Object?>[];
}

class SearchCleared extends SearchEvent {
  const SearchCleared();
}

class SearchQueryChanged extends SearchEvent {
  final String query;
  const SearchQueryChanged(this.query);
  @override
  List<Object?> get props => <Object?>[query];
}

class SearchRequested extends SearchEvent {
  final String query;
  const SearchRequested(this.query);
  @override
  List<Object?> get props => <Object?>[query];
}

class SearchLoadMoreRequested extends SearchEvent {
  const SearchLoadMoreRequested();
}
