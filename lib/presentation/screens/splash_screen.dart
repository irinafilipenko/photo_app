import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_app/app_router.dart';
import 'package:photo_app/presentation/bloc/splash_bloc.dart';
import 'package:photo_app/presentation/bloc/splash_state.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  void checkUserStatus() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      context.read<SplashBloc>().add(CheckUserStatusEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          print('Current state: $state');

          if (state is SplashAuthenticated) {
            print("SplashAuthenticated");
            context.router.push(const MainRoute());
          } else if (state is SplashError) {
            print("SplashError");
            context.router.push(const LoginRoute());
          }
        },
        child: Container(color: Colors.blue));
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.blue,
//       ),
//     );
//   }
// }
