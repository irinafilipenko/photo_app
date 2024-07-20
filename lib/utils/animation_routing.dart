import 'package:photo_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

Route createRoute() {
  return PageRouteBuilder(
    transitionDuration:
        const Duration(milliseconds: 2000), // Set the duration to 1 second
    pageBuilder: (context, animation, secondaryAnimation) =>
        const MainScreen(), // Replace with your target screen
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var fadeAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: fadeAnimation,
        child: child,
      );
    },
  );
}
