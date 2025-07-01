
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/case_manager/job_details/presentation/widgets/job_detail_desc.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientJobDetailPage extends StatefulWidget {
  const ClientJobDetailPage({super.key});

  @override
  State<ClientJobDetailPage> createState() => _ClientJobDetailPageState();
}

class _ClientJobDetailPageState extends State<ClientJobDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.col007FC4,
        body: LayoutBuilder(builder: (context, constraints){
          final double constraintsHeight = constraints.maxHeight;
          final double constraintsWidth = constraints.maxWidth;
          double width = MediaQuery.of(context).size.width;
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                    child: Column(
                      children: [
                        Text(
                          "Job",
                          style: semiBoldTextStyle(fontSize: dimen15.sp, color: AppColors.colWhite),
                        ),
                        Text(
                          "Data Entry Associate",
                          style: semiBoldTextStyle(fontSize: dimen22.sp, color: AppColors.colWhite),
                        ),
                      ],
                    )),
                SizedBox(height: 20.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.colWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.sp),
                        topRight: Radius.circular(40.sp),
                      ),
                    ),
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // User Profile Tile
                                Container(
                                  padding: EdgeInsets.all(15.sp),
                                  decoration: BoxDecoration(
                                    color: AppColors.colWhite,
                                    borderRadius: BorderRadius.circular(10.r),
                                    boxShadow: AppCommonWidgets().commonBoxShadow(),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 60.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.colF5F5,
                                        ),
                                        child: Image.asset(
                                          "assets/image/male_2.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Hello! John",
                                              style: semiBoldTextStyle(fontSize: dimen16.sp, color: AppColors.col007FC4)),
                                          Text("I’m Jenna your case manager happy to help 🤍",
                                              style: regularTextStyle(fontSize: dimen8.sp, color: AppColors.col004576)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                //Work Location
                                Container(
                                  margin: EdgeInsets.only(top: 40.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.w, vertical: 15.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                          color: AppColors.col1E1E.withOpacity(0.1))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Work Location",
                                            style: semiBoldTextStyle(
                                                fontSize: dimen16.h,
                                                color: AppColors.col333),
                                          ),
                                          SvgPicture.asset(
                                            Assets.svg.locationOn,
                                            height: 20.h,
                                            width: 20.w,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            Assets.svg.corporateFare,
                                            height: 15.h,
                                            width: 15.w,
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "6363 De Zavala Rd, San Antonio, TX 78249",
                                              style: semiBoldTextStyle(
                                                  fontSize: dimen13.sp,
                                                  color: AppColors.col6666),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            Assets.svg.call,
                                            height: 15.h,
                                            width: 15.w,
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "+1 (505) 123 - 4567",
                                              style: semiBoldTextStyle(
                                                  fontSize: dimen13.sp,
                                                  color: AppColors.col6666),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                //Job Detail
                                JobDetailDesc(),
                                SizedBox(
                                  height: 50.h,
                                ),
                              ],
                            ),
                            Positioned(
                              top: width >= 600 ? constraintsHeight * 0.12 : constraintsHeight * 0.11,
                              left: constraintsWidth * 0.55,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Spacer(),
                                  SvgPicture.asset(Assets.svg.callIconJob),
                                  SizedBox(width: 25.w),
                                ],
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                )
              ]);
        }));
  }

  Widget _navIcon(VoidCallback onTap, String asset) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(asset),
    );
  }
}
