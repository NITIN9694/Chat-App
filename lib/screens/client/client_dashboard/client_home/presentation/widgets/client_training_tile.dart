import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ClientTrainingTile extends StatefulWidget {
  double maxHeight;
  double maxWidth;

  ClientTrainingTile(this.maxHeight, this.maxWidth, {super.key});

  @override
  State<ClientTrainingTile> createState() => _ClientTrainingTileState();
}

class _ClientTrainingTileState extends State<ClientTrainingTile> {
  final PageController _controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.maxHeight * 0.35,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showBottomSheet(context);
                  },
                  child: Container(
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
                            padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
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
                                      style: semiBoldTextStyle(fontSize: dimen16.sp, color: AppColors.colWhite),
                                    ),
                                    Text(
                                      "14:30 minutes",
                                      style: regularTextStyle(
                                          fontSize: dimen11.sp, color: AppColors.colBlack.withOpacity(0.5)),
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
                              style: lightTextStyle(fontSize: dimen10.sp, color: AppColors.colWhite),
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
                                  style: semiBoldTextStyle(fontSize: dimen16.sp, color: AppColors.colWhite),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "⚠️ 4 days overdue",
                                  style: lightTextStyle(fontSize: dimen10, color: AppColors.colFFCD00),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColors.colWhite.withOpacity(0.2),
                                AppColors.colWhite.withOpacity(0.2),
                              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                              color: AppColors.colWhite,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.h), bottomRight: Radius.circular(10.h)),
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Container(
                                  width: 120.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.colWhite, borderRadius: BorderRadius.circular(10.r)),
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
                                        style: mediumTextStyle(fontSize: dimen10.sp, color: AppColors.col007FC4),
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
                      )),
                );
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 12,
              activeDotColor: AppColors.col6666.withOpacity(0.3),
              dotColor: AppColors.col6666.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.h)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final double constraintsHeight = constraints.maxHeight;
            final double constraintsWidth = constraints.maxWidth;
            return StatefulBuilder(builder: (context, setModalState) {
              return SizedBox(
                height: constraintsHeight * 0.7,
                width: constraintsWidth * 0.98,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: Container(
                              height: 5,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: AppColors.colD9D9.withOpacity(0.4), borderRadius: BorderRadius.circular(10.r)),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("First screening round",
                                  style: regularTextStyle(
                                      fontSize: dimen18.sp, color: AppColors.colBlack.withOpacity(0.5))),
                              SvgPicture.asset(
                                Assets.svg.autoplay1,
                                height: 18.h,
                                width: 18.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            margin: EdgeInsets.only(right: widget.maxWidth * 0.5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: AppColors.colE2F1FA,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.svg.calendarMonth,
                                  height: 11.h,
                                  width: 11.w,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  "Due By:  12 Jan 2025",
                                  style: regularTextStyle(fontSize: dimen9.sp, color: AppColors.col004576),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Summary",
                                  style: semiBoldTextStyle(fontSize: 11.sp, color: AppColors.col6C7),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.r),
                                  margin: EdgeInsets.symmetric(vertical: 5.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.col6C7.withOpacity(0.1)),
                                  child: Center(
                                      child: Text(
                                    "You have an interview for Data Entry role the session will aim to address brainstorming ideas and responsibilities. The screening process shall determine the further progress.  ",
                                    style: regularTextStyle(fontSize: 14.sp, color: AppColors.col1A1C1E),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(22.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.colE1E1E1.withOpacity(0.2),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.svg.link,
                              colorFilter: ColorFilter.mode(AppColors.col007FC4, BlendMode.srcIn),
                              height: 15.h,
                              width: 15.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                "Take the course",
                                style: boldTextStyle(fontSize: dimen14.sp, color: AppColors.col007FC4),
                              ),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              Assets.svg.openInNew,
                              height: 15.h,
                              width: 15.w,
                            )
                          ]),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 35.h),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: AppColors.col007FC4,
                          ),
                          child: Center(
                            child: Text(
                              "Okay",
                              style: semiBoldTextStyle(
                                  fontSize: dimen14.sp,
                                  color: AppColors.colWhite),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              );
            });
          },
        );
      },
    );
  }
}
