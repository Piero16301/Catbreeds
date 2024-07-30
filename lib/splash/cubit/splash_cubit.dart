import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future<void> init() async {
    emit(state.copyWith(status: SplashStatus.loading));
    await Future<void>.delayed(const Duration(seconds: 3));
    emit(state.copyWith(status: SplashStatus.success));
  }
}
