import 'package:endeavors/styles/colors.dart';
import 'package:flutter/material.dart';

class BaseSafeAreaLayout extends StatelessWidget {
  final Widget child;

  const BaseSafeAreaLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colBlack, // Global safe area background color
      child: SafeArea(
        child: child,
      ),
    );
  }
}