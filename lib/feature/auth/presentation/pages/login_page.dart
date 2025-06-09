
import 'package:endeavors/feature/auth/presentation/bloc/login_bloc.dart';
import 'package:endeavors/feature/auth/presentation/widgets/logintext_filed.dart';
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/routes/app_pages.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  double _width = 300.w;
  bool _isAnimating = false;

  void _animateToCircle() {
    setState(() {
      _width = 80.w;
      _isAnimating = true;
    });
  }

  void _resetButton() {
    setState(() {
      _width = 330.w;
      _isAnimating = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc,LoginState>(
      listener: (context,state){
        if(state is LoginLoading && !_isAnimating){
          _animateToCircle();
        }
        if(state is LoginSuccess){
          _resetButton();
          Navigator.pushReplacementNamed(context, AppRoutes.dashBoard);

        }
      },
      builder: (context,state){
        bool isLoading = state is LoginLoading;

        return Scaffold(
            backgroundColor: AppColors.colWhite,
            body:Stack(
              children: [
                Assets.image.loginBg.image(fit: BoxFit.cover), // Background image
                Align(
                  alignment:Alignment(0, -0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.image.appLogo.image(height: 23.h, width: 120.w),
                      SizedBox(height: 25.h),
                      Text(
                        "Get Started now",
                        style: boldTextStyle(
                          fontSize: dimen32.sp,
                          color: AppColors.colBlack,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: mediumTextStyle(
                                fontSize: dimen11.sp,
                                color: AppColors.col6C7,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            CustomTextField(
                              hintText: 'Email',
                              controller: emailController,
                              isPassword: false,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              "Password",
                              style: mediumTextStyle(
                                fontSize: dimen11.sp,
                                color: AppColors.col6C7,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            CustomTextField(
                              hintText: 'Password',
                              controller: passwordController,
                              isPassword: true,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(2.h),
                                          border: Border.all(    color: AppColors.col6C7,width: 1.w)
                                      ),
                                      child: Center(
                                        child: Icon(Icons.done,color:Colors.transparent
                                          // AppColors.col6C7
                                          ,size: 8.h,),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text("Remember me",
                                      style: mediumTextStyle(fontSize: dimen11.sp, color: AppColors.col6C7),
                                    )
                                  ],
                                ),

                                Text("Forgot Password?",
                                  style: mediumTextStyle(fontSize: dimen11.sp, color: AppColors.col4D8),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: (){
                                  context.read<LoginBloc>().add(LoginButtonPressed());
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 900),
                                  width: _width,
                                  curve: Curves.easeInOut,
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.h),

                                      color: AppColors.colD6E7,
                                    gradient: LinearGradient(
                                      colors: [
                                       // Start color
                                        Color(0xff375DFB),
                                        Color(0xff375DFB)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],

                                  ),
                                  child: Center(child: isLoading?
                                       CircularProgressIndicator(
                                         strokeWidth: 2,
                                         color: AppColors.colD6E7,
                                         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                       )
                                      :Text("Log In",
                                    style: mediumTextStyle(fontSize: 13.sp, color: AppColors.colWhite),
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        );
      },
    );
  }
}
