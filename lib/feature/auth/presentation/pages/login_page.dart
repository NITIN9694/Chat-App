
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colWhite,
      body: Stack(
        children: [
          Assets.image.loginBg.image(),
          Positioned(

              bottom: 0,
              left: 0,
              right: 0,
              child:    Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.image.appLogo.image(height: 23.h,width: 120.w),
              Text("Get Started now",
              style:boldTextStyle(fontSize: dimen26.sp,color: AppColors.colBlack) ,
              )

            ],
          ))
        ],
      ),
    );
  }
}
