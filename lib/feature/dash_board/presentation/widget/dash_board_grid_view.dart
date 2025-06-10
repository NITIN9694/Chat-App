import 'package:endeavors/feature/dash_board/data/dash_board_person_model.dart';
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardGridView extends StatelessWidget {
  List<DashBoardPersonModel> dashBoardPersonModel;
   DashBoardGridView({super.key,required this.dashBoardPersonModel});

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(12),
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 13.sp,
      ),
      itemCount: dashBoardPersonModel.length,
      itemBuilder: (context, index) {
        final person =
        dashBoardPersonModel[index];
        return Container(
            padding: EdgeInsets.all(10.sp),
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
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.start,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
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
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                          person.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: regularTextStyle(fontSize: dimen11.sp, color: AppColors.col8888.withOpacity(0.5))
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7.h,),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(person.jobStatus,
                      style: mediumTextStyle(fontSize: dimen11.sp, color: AppColors.col00B383),
                    ),
                    SvgPicture.asset(Assets.svg.call,height: 15.h,width: 15.w,)
                  ],
                )
              ],
            ));

      },
    );
  }
}
