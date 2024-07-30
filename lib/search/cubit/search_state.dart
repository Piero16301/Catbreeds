part of 'search_cubit.dart';

enum SearchStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == SearchStatus.initial;
  bool get isLoading => this == SearchStatus.loading;
  bool get isSuccess => this == SearchStatus.success;
  bool get isFailure => this == SearchStatus.failure;
}

class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.initial,
    this.name = '',
    this.cats = const <Cat>[],
  });

  final SearchStatus status;
  final String name;
  final List<Cat> cats;

  SearchState copyWith({
    SearchStatus? status,
    String? name,
    List<Cat>? cats,
  }) {
    return SearchState(
      status: status ?? this.status,
      name: name ?? this.name,
      cats: cats ?? this.cats,
    );
  }

  @override
  List<Object> get props => [
        status,
        name,
        cats,
      ];
}
