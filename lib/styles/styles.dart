
///styles.dart contains several style definitions for the app, like statusBar style, TextStyles, InputDecoration style and more.

import 'package:endeavors/styles/sizes.dart';
import 'package:flutter/material.dart';

lightTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color, fontFamily: "RobotoLight");
}

regularTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w500,height: height, fontFamily: "RobotoRegular");
}

mediumTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color, fontFamily: "RobotoMedium");
}

semiBoldTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w700, fontFamily: "RobotoSemiBold");
}

boldTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w700, fontFamily: "RobotoBold");
}

appBarTextStyle({fontSize,required color}) {
  return TextStyle(fontSize: fontSize??dimen20, color: color,fontWeight: FontWeight.w700, fontFamily: "RobotoRegular");
}

extraSmallBorderRadius(){
  return BorderRadius.circular(2);
}

smallBorderRadius(){
  return BorderRadius.circular(4);
}

mediumBorderRadius(){
  return BorderRadius.circular(6);
}

largeBorderRadius(){
  return BorderRadius.circular(10);
}



