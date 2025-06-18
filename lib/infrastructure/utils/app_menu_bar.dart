import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AppMenuBar extends StatelessWidget {
  const AppMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: (){
              ZoomDrawer.of(context)!.toggle();
            },
            child: SvgPicture.asset(Assets.svg.terminal,height: 22.h,width: 22.w,)),
        Spacer(),
        Assets.image.appLogo.image(fit: BoxFit.contain,width: 90.w,height: 18.h),
        Spacer(),
      ],
    );
  }
}
