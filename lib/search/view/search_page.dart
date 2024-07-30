import 'package:catbreeds/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(
        context.read<UserRepository>(),
        name,
      )..searchCatsByName(),
      child: const SearchView(),
    );
  }
}
