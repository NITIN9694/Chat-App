import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/client_detail/presentation/widgets/assigned_task_list.dart';
import 'package:endeavors/screens/client_detail/presentation/widgets/assigned_training_list.dart';
import 'package:endeavors/screens/client_detail/presentation/widgets/job_detail_tile.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ClientPageDetail extends StatefulWidget {
  const ClientPageDetail({super.key});

  @override
  State<ClientPageDetail> createState() => _ClientPageDetailState();
}

class _ClientPageDetailState extends State<ClientPageDetail> {
  final PageController _controller = PageController(viewportFraction: 1.0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.col007FC4,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: AppCommonWidgets().commonAppBar(context, "Clients"),
            ),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //user profile tile

                          Container(
                            padding: EdgeInsets.all(15.sp),
                            decoration: BoxDecoration(
                              color: AppColors.colWhite,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: AppCommonWidgets().commonBoxShadow(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                SizedBox(
                                  width: 7.w,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Client",
                                          style: regularTextStyle(
                                              fontSize: dimen8.sp,
                                              color: AppColors.col718E),
                                        ),
                                        Text(
                                          "Jhon Mills",
                                          style: mediumTextStyle(
                                              fontSize: dimen11.sp,
                                              color: AppColors.col718E),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Work Shift",
                                          style: regularTextStyle(
                                              fontSize: dimen8.sp,
                                              color: AppColors.col718E),
                                        ),
                                        Text(
                                          "12:00-15:30 EST",
                                          style: mediumTextStyle(
                                              fontSize: dimen11.sp,
                                              color: AppColors.col718E),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 3.h,
                                        width: 3.w,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.col007616),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "employed".toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: semiBoldTextStyle(
                                              fontSize: dimen9.sp,
                                              color: AppColors.col007616),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          //work location tile
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

                          //job detsils
                          JobDetailTile(),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "Assigned Tasks",
                                style: semiBoldTextStyle(
                                    fontSize: dimen16.sp,
                                    color: AppColors.col333),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Container(
                                padding: EdgeInsets.all(3.sp),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: AppColors.col004576)),
                                child: Center(
                                  child: Text(
                                    "25",
                                    style: lightTextStyle(
                                        fontSize: dimen8.sp,
                                        color: AppColors.col004576),
                                  ),
                                ),
                              )
                            ],
                          ),
                          //Assigned Task
                          AssignedTaskList(),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "Assigned Tasks",
                                style: semiBoldTextStyle(
                                    fontSize: dimen16.sp,
                                    color: AppColors.col333),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Container(
                                padding: EdgeInsets.all(3.sp),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: AppColors.col004576)),
                                child: Center(
                                  child: Text(
                                    "25",
                                    style: lightTextStyle(
                                        fontSize: dimen8.sp,
                                        color: AppColors.col004576),
                                  ),
                                ),
                              )
                            ],
                          ),
                          //Assigned training
                          AssignedTrainingList(),
                        ],
                      ),
                      Positioned(
                        top: kToolbarHeight + 20.h,
                        left: kToolbarHeight + 30.w,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.svg.docIconJob),
                            SvgPicture.asset(Assets.svg.calIconJob),
                            SvgPicture.asset(Assets.svg.docChatJob),
                            SvgPicture.asset(Assets.svg.callIconJob),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  double getHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width >= 900) return 350.h; // Large tablets
    if (width >= 600) return 250.h; // Small tablets
    return 200.h; // Phones
  }
}
