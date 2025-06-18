


import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_toast.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class SideMenu extends StatefulWidget {
  final Function(int) onItemSelected;

  const SideMenu({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final items = ['Clients', 'Chat', 'Calendar', 'Job', 'Terms & Conditions', 'Sign Out'];
  final assetsName = [Assets.svg.person, Assets.svg.modeComment, Assets.svg.calendarMonth1, Assets.svg.checkedBag, Assets.svg.clinicalNotes,  Assets.svg.modeOffOn];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.colB6D, // light blue
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            IconButton(
              icon:   SvgPicture.asset(Assets.svg.cancel),
              onPressed: () => ZoomDrawer.of(context)!.close(),
            ),
            ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return  GestureDetector(
                    onTap: (){
                      ZoomDrawer.of(context)!.close();
                      if(index==0){
                        widget.onItemSelected(index);
                      }else if(index==1){
                        widget.onItemSelected(2);

                      }else if(index==2){
                        widget.onItemSelected(3);

                      }else if(index==3){
                        widget.onItemSelected(1);

                      }else if(index==4){
                        showCustomToast(
                            context,
                            "Work in progress",
                            ToastType.warning);
                      }else{
                        showCustomToast(
                            context,
                            "Work in progress",
                            ToastType.warning);
                      }



                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.r),
                          margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),

                          decoration: BoxDecoration(
                            color: AppColors.colWhite,
                            borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: Center(
                            child: SvgPicture.asset(assetsName[index], width: 11.h, height: 11.w),
                          ),
                        ),
                         Text(items[index], style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  );


                }),

            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("APP VERSION 1.01", style: semiBoldTextStyle(fontSize: dimen12.sp, color: AppColors.col004576)),
                  Text("All rights reserved.", style: lightTextStyle(fontSize: dimen10.sp,color: AppColors.col004576)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}