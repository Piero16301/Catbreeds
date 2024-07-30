import 'package:catbreeds/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.cat,
    super.key,
  });

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailsCubit(context.read<UserRepository>())..init(cat),
      child: const DetailsView(),
    );
  }
}
