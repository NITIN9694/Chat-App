
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppCommonWidgets{
  List<BoxShadow> commonBoxShadow(){
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ];
  }
}