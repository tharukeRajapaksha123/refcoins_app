import 'package:flutter/material.dart';

Route<dynamic> bottomPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return page;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1), // start the transition from bottom
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
