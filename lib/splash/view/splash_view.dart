import 'package:catbreeds/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.goNamed('home');
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  'Catbreeds',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Positioned(
                bottom: 20,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: RiveAnimation.asset(
                    'assets/animations/cat_saying_hi.riv',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
