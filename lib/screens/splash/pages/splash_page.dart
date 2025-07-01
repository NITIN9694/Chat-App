
import 'package:endeavors/infrastructure/app_constant/app_constant.dart';
import 'package:endeavors/infrastructure/local_storage/pref_manager.dart';
import 'package:endeavors/screens/splash/bloc/splash_bloc.dart';
import 'package:endeavors/screens/splash/bloc/splash_event.dart';
import 'package:endeavors/screens/splash/bloc/splash_state.dart';
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/routes/app_pages.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
   _controller = AnimationController(vsync: this,
  duration: const Duration(seconds: 1)
   );

   _animation = Tween<double>(begin: 0.2,end: 1.0).animate(
     CurvedAnimation(parent: _controller, curve: Curves.easeOut)
   );

   _controller.forward().whenComplete((){
     context.read<SplashBloc>().add(CheckAuthentication());
   });
    super.initState();
  }

 @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc,SplashSate>(listener: (context,state){
      if (state is SplashNavigationToLogin) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      } else if (state is SplashNavigateToHome) {
        var isCaseManager = HiveManager.getBool(AppConstants.isCaseManger);
        if(isCaseManager){
          Navigator.pushReplacementNamed(context, AppRoutes.main);

        }else{
          Navigator.pushReplacementNamed(context, AppRoutes.clientMainPage);

        }
      }
    },
      child: Scaffold(
        backgroundColor: AppColors.colWhite,
        body: Center(
          child: ScaleTransition(scale: _animation,
            child: Center(
              child: Padding(
                padding:  EdgeInsets.all(48.h),
                child: Assets.image.appLogo.image(),
              ),
            ),
          ),
        ),

      ),

    );
  }
}
