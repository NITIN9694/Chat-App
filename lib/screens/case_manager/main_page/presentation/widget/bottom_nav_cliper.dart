




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavClipper extends CustomClipper<Path> {
  final double animatedPosition;
  final int itemCount;
  final double curveHeight;

  BottomNavClipper({

    required this.animatedPosition,
    required this.itemCount,
    required this.curveHeight, // default curve height
  });

  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    final double itemWidth = width/itemCount;
    final double curveWidth = 70.w;

    final double center = animatedPosition * itemWidth + (itemWidth) / 2;

    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(center - curveWidth / 2, 0);

    //  Use the curveHeight value directly here
    // Wave-like dip
    path.cubicTo(
      center - curveWidth / 4, 0,
      center - curveWidth / 4, curveHeight,
      center, curveHeight,
    );
    path.cubicTo(
      center + curveWidth / 4, curveHeight,
      center + curveWidth / 4, 0,
      center + curveWidth / 2, 0,
    );

    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant BottomNavClipper oldClipper) {
    return oldClipper.animatedPosition != animatedPosition ||
        oldClipper.curveHeight != curveHeight;
  }
}

