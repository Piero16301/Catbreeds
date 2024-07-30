import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._userRepository) : super(const DetailsState());

  final UserRepository _userRepository;

  void init(Cat cat) {
    emit(state.copyWith(cat: cat));
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
