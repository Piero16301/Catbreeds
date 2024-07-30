part of 'details_cubit.dart';

enum DetailsStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == DetailsStatus.initial;
  bool get isLoading => this == DetailsStatus.loading;
  bool get isSuccess => this == DetailsStatus.success;
  bool get isFailure => this == DetailsStatus.failure;
}

class DetailsState extends Equatable {
  const DetailsState({
    this.status = DetailsStatus.initial,
    this.cat = Cat.empty,
  });

  final DetailsStatus status;
  final Cat cat;

  DetailsState copyWith({
    DetailsStatus? status,
    Cat? cat,
  }) {
    return DetailsState(
      status: status ?? this.status,
      cat: cat ?? this.cat,
    );
  }

  @override
  List<Object> get props => [
        status,
        cat,
      ];
}
