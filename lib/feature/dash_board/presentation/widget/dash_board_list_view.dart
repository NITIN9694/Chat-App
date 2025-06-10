

import 'package:endeavors/feature/dash_board/data/dash_board_person_model.dart';
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardListView extends StatelessWidget {
  List<DashBoardPersonModel> dashBoardPersonModel;
  DashBoardListView({super.key,required this.dashBoardPersonModel});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: dashBoardPersonModel.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index){
          final person =
          dashBoardPersonModel[index];
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 7.h),
        margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.colWhite,

          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
              width: 40.w,
              child: CircleAvatar(

                radius: 16.sp,
                backgroundImage:
                AssetImage(person.avatarUrl),
                backgroundColor:  AppColors.colE2F1FA,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    person.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: regularTextStyle(fontSize: dimen11.sp, color: AppColors.col8888.withOpacity(0.5))
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.svg.call,height: 8.h,width: 8.w,),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                        "+91 1232424323",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: regularTextStyle(fontSize: dimen11.sp, color: AppColors.col8888.withOpacity(0.5))
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("VRS Case ID:",
                  style: regularTextStyle(fontSize: dimen8.sp, color: AppColors.col718E),
                ),
                Text(person.caseId,
                  style: mediumTextStyle(fontSize: dimen11.sp, color: AppColors.col718E),
                ),
                SizedBox(height: 12.h,),
                Text("Job Status",
                  style: regularTextStyle(fontSize: dimen8.sp, color: AppColors.col718E),
                ),
                Text(person.jobStatus,
                  style: mediumTextStyle(fontSize: dimen11.sp, color: AppColors.col00B383),
                ),
              ],
            )
          ],
        ) ,
      );
    });
  }
}
