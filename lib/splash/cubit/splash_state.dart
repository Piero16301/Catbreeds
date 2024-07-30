part of 'splash_cubit.dart';

enum SplashStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == SplashStatus.initial;
  bool get isLoading => this == SplashStatus.loading;
  bool get isSuccess => this == SplashStatus.success;
  bool get isFailure => this == SplashStatus.failure;
}

class SplashState extends Equatable {
  const SplashState({
    this.status = SplashStatus.initial,
  });

  final SplashStatus status;

  SplashState copyWith({
    SplashStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
