import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._userRepository, this.name) : super(const SearchState());

  final UserRepository _userRepository;
  final String name;

  Future<void> searchCatsByName() async {
    emit(state.copyWith(status: SearchStatus.loading, name: name));
    try {
      final cats = await _userRepository.searchCatsByName(name);
      emit(state.copyWith(status: SearchStatus.success, cats: cats));
    } catch (e) {
      emit(state.copyWith(status: SearchStatus.success, cats: []));
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
