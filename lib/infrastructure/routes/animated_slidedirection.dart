

import 'package:flutter/material.dart';

enum SlideDirection { leftToRight, rightToLeft, bottomToTop, topToBottom }

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final SlideDirection direction;

  SlidePageRoute({required this.page, this.direction = SlideDirection.bottomToTop})
      : super(
    pageBuilder: (_, __, ___) => page,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (_, animation, __, child) {
      late Offset begin;

      switch (direction) {
        case SlideDirection.leftToRight:
          begin = const Offset(-1.0, 0.0);
          break;
        case SlideDirection.rightToLeft:
          begin = const Offset(1.0, 0.0);
          break;
        case SlideDirection.topToBottom:
          begin = const Offset(0.0, -1.0);
          break;
        case SlideDirection.bottomToTop:
          begin = const Offset(0.0, 1.0);
          break;
      }

      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
