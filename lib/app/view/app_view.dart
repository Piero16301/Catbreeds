import 'package:catbreeds/app/app.dart';
import 'package:catbreeds/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final themes = <String, ThemeData>{
  'light': appLightTheme,
  'dark': appDarkTheme,
};

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = goRouter();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => MaterialApp.router(
        title: 'Reserva Canchas',
        routeInformationProvider: _router.routeInformationProvider,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(state.language),
        theme: themes['light'],
        darkTheme: themes['dark'],
        themeAnimationCurve: Curves.easeInOut,
        themeAnimationDuration: const Duration(milliseconds: 500),
        themeMode: state.theme == 'dark' ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
