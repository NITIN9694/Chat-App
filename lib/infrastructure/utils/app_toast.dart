import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
enum ToastType { success, warning, error }

void showCustomToast(BuildContext context, String message, ToastType type) {
  Color bgColor;
  IconData icon;

  switch (type) {
    case ToastType.success:
      bgColor = Colors.green;
      icon = Icons.check_circle;
      break;
    case ToastType.warning:
      bgColor = Colors.orange;
      icon = Icons.warning;
      break;
    case ToastType.error:
      bgColor = Colors.red;
      icon = Icons.error;
      break;
  }

  Flushbar(
    message: message,
    icon: Icon(icon, size: 28.0, color: Colors.white),
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: bgColor,
    backgroundColor: bgColor,
    margin: EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
  ).show(context);
}
