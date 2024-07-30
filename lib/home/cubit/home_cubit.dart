import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._userRepository) : super(const HomeState());

  final UserRepository _userRepository;

  Future<List<Cat>> getCats(int page, int limit) async {
    try {
      final cats = await _userRepository.getCatsPaginated(
        limit: limit,
        page: page,
      );
      return cats;
    } catch (e) {
      return [];
    }
  }

  Future<String> getCatImage(String id) async {
    try {
      final image = await _userRepository.getCatImage(id);
      return image;
    } catch (e) {
      return '';
    }
  }
}
