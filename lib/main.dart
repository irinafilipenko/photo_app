import 'package:get_it/get_it.dart';
import 'package:photo_app/app_router.dart';
import 'package:photo_app/injectable_config.dart';
import 'package:photo_app/presentation/bloc/auth_bloc.dart';
import 'package:photo_app/presentation/bloc/photo_bloc.dart';
import 'package:photo_app/presentation/bloc/splash_bloc.dart';
import 'package:photo_app/presentation/components/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (context) => GetIt.I<SplashBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => GetIt.I<AuthBloc>(),
        ),
        BlocProvider<PhotoBloc>(
          create: (context) => GetIt.I<PhotoBloc>()..add(FetchPhoto()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Photo App',
        debugShowCheckedModeBanner: false,
        theme: lightTheme, // Apply the light theme
        darkTheme: darkTheme, // Apply the dark theme
        themeMode: ThemeMode.system,
        routerConfig: GetIt.I<AppRouter>().config(),
      ),
    );
  }
}
