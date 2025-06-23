import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssignedTrainingList extends StatelessWidget {
  const AssignedTrainingList({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    return SizedBox(
      height: 200.h,
      child: PageView.builder(
        controller: _controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10.h, left: index == 0 ? 0.w : 10),
              decoration: BoxDecoration(
                color: AppColors.colFAFAFA,
                borderRadius: BorderRadius.circular(10.r),
                gradient: LinearGradient(colors: [
                  AppColors.col2D60FF,
                  AppColors.col539BFF,
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Basic Work Ethics",
                              style: semiBoldTextStyle(
                                  fontSize: dimen16.sp,
                                  color: AppColors.colWhite),
                            ),
                            Text(
                              "14:30 minutes",
                              style: regularTextStyle(
                                  fontSize: dimen11.sp,
                                  color: AppColors.colBlack.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        Image.asset("assets/image/autoplay.png")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Due By",
                      style: lightTextStyle(
                          fontSize: dimen10.sp, color: AppColors.colWhite),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "12 Jan 2025",
                          style: semiBoldTextStyle(
                              fontSize: dimen16.sp, color: AppColors.colWhite),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "⚠️ 4 days overdue",
                          style: lightTextStyle(
                              fontSize: dimen10, color: AppColors.colFFCD00),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            AppColors.colWhite.withOpacity(0.2),
                            AppColors.colWhite.withOpacity(0.2),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      color: AppColors.colWhite,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.h),
                          bottomRight: Radius.circular(10.h)),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 120.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.colWhite,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.svg.notificationAdd,
                                height: 15.h,
                                width: 15.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "Send Reminder",
                                style: mediumTextStyle(
                                    fontSize: dimen10.sp,
                                    color: AppColors.col007FC4),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
