import 'package:dio/dio.dart';
import 'package:photo_app/app_router.dart';
import 'package:photo_app/data/service/local_data_storage.dart';
import 'package:photo_app/presentation/bloc/auth_bloc.dart';
import 'package:photo_app/presentation/bloc/photo_bloc.dart';
import 'package:photo_app/presentation/bloc/splash_bloc.dart';
import 'package:photo_app/presentation/components/theme.dart';
import 'package:photo_app/data/repositories/photo_repository.dart';
import 'package:photo_app/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final localDataStorage = LocalDataStorageImpl();
  final dio = Dio();
  final userRepository = UserRepository(dio, localDataStorage);
  final photoRepository = PhotoRepository(dio);

  final _appRouter = AppRouter();

  runApp(MyApp(
    appRouter: _appRouter,
    userRepository: userRepository,
    photoRepository: photoRepository,
    localDataStorage: localDataStorage,
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final PhotoRepository photoRepository;
  final AppRouter appRouter;
  final LocalDataStorage localDataStorage;

  const MyApp(
      {super.key,
      required this.appRouter,
      required this.userRepository,
      required this.photoRepository,
      required this.localDataStorage});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(localDataStorage: localDataStorage),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(userRepository: userRepository),
        ),
        BlocProvider<PhotoBloc>(
          create: (context) =>
              PhotoBloc(photoRepository: photoRepository)..add(FetchPhoto()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Photo App',
        debugShowCheckedModeBanner: false,
        theme: lightTheme, // Apply the light theme
        darkTheme: darkTheme, // Apply the dark theme
        themeMode: ThemeMode.system,
        routerConfig: appRouter.config(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const LoginScreen(),
        //   '/main': (context) => const MainScreen(),
        // },
      ),
    );
  }
}
