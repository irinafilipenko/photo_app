import 'package:photo_app/bloc/auth_bloc.dart';
import 'package:photo_app/bloc/photo_bloc.dart';
import 'package:photo_app/components/theme.dart';
import 'package:photo_app/repositories/photo_repository.dart';
import 'package:photo_app/repositories/user_repository.dart';
import 'package:photo_app/screens/login_screen.dart';
import 'package:photo_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final userRepository = UserRepository();
  final photoRepository = PhotoRepository();

  runApp(
      MyApp(userRepository: userRepository, photoRepository: photoRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final PhotoRepository photoRepository;

  const MyApp(
      {super.key, required this.userRepository, required this.photoRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(userRepository: userRepository),
        ),
        BlocProvider<PhotoBloc>(
          create: (context) =>
              PhotoBloc(photoRepository: photoRepository)..add(FetchPhoto()),
        ),
      ],
      child: MaterialApp(
        title: 'Photo App',
        debugShowCheckedModeBanner: false,
        theme: lightTheme, // Apply the light theme
        darkTheme: darkTheme, // Apply the dark theme
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/main': (context) => const MainScreen(),
        },
      ),
    );
  }
}
