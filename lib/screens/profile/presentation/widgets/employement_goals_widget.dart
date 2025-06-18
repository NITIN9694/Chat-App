

import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmploymentGoalsWidget extends StatelessWidget {
  String title;
  String desc;
  String date;
  bool isExpanded;
  final VoidCallback onTap;
  EmploymentGoalsWidget({super.key,required this.title,required this.isExpanded,required this.date,required this.desc,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.col1E1E.withOpacity(0.1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap:onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.colF0F9FF,
                  ),
                  child:  SvgPicture.asset(Assets.svg.barcode),
                ),
                SizedBox(width: 4.w,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Occupational Title ",
                    style: regularTextStyle(fontSize: 10.sp, color: AppColors.col3388.withOpacity(0.4)),
                    ),
                    Text(title,
                      style: regularTextStyle(fontSize: 16.sp, color: AppColors.col6666)),

                  ],
                ),
                Spacer(),
                SvgPicture.asset(isExpanded?Assets.svg.keyboardArrowUp:Assets.svg.keyboardArrowDown,
                  height: 8.h,
                  width: 8.w,
                )
              ],
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
          curve: Curves.easeInOutBack,
          child:ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: isExpanded?1.0:0.0,
              child:  Container(
                padding: EdgeInsets.all(15.r),
                margin: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.col007FC4),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Summary",
                      style: regularTextStyle(fontSize: dimen12.sp, color: AppColors.col6666),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(desc,
                      style: regularTextStyle(fontSize: dimen12.sp, color: AppColors.col007FC4),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text("Achievement Status",
                      style:regularTextStyle(fontSize: 10.sp, color: AppColors.col3388.withOpacity(0.4)),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(date,
                      style: boldTextStyle(fontSize: dimen16.sp, color: AppColors.col6666),
                    ),
                  ],
                ),
              ),
            ),
          ),

          )
        ],
      ),
    );
  }
}
