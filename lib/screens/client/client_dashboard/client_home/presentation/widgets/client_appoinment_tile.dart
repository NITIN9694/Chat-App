import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ClientAppointmentTile extends StatefulWidget {
  double maxHeight;
  double maxWidth;
  ClientAppointmentTile(this.maxHeight, this.maxWidth, {super.key});

  @override
  State<ClientAppointmentTile> createState() => _ClientAppointmentTileState();
}

class _ClientAppointmentTileState extends State<ClientAppointmentTile> {
  final PageController _controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.maxHeight * 0.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Main card container

                        Container(
                          padding: EdgeInsets.all(12.r),
                          margin: EdgeInsets.only(top: 12.h), // push down to make space for scallops
                          decoration: BoxDecoration(
                            color: AppColors.colD6ECFF,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  left: widget.maxWidth * 0.5,
                                  child: SvgPicture.asset(Assets.svg.calendarClock)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Role sync-up meeting with the authorities",
                                    style: semiBoldTextStyle(fontSize: dimen18.sp, color: AppColors.col004576),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.r),
                                        decoration: BoxDecoration(
                                            color: AppColors.colE8F7FF, borderRadius: BorderRadius.circular(10.w)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              Assets.svg.calendarMonth,
                                              height: 10.h,
                                              width: 10.w,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              "TUE | 14 Jan 2025",
                                              style: regularTextStyle(fontSize: dimen9.sp, color: AppColors.col004576),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10.r),
                                        decoration: BoxDecoration(
                                            color: AppColors.colE8F7FF, borderRadius: BorderRadius.circular(10.w)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              Assets.svg.calendarMonth,
                                              height: 10.h,
                                              width: 10.w,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              "TUE | 14 Jan 2025",
                                              style: regularTextStyle(fontSize: dimen9.sp, color: AppColors.col004576),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "You have an interview for Data Entry role. The session will aim to address brainstorming ideas and responsibilities. The screening process shall determine the further progress.",
                                    style: TextStyle(fontSize: 14, color: Colors.black87),
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    padding: EdgeInsets.all(10.r),
                                    decoration: BoxDecoration(
                                        color: AppColors.colE8F7FF, borderRadius: BorderRadius.circular(10.w)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.svg.apartment,
                                          height: 10.h,
                                          width: 10.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "6363 De Zavala Rd, San Antonio, TX 7824949",
                                            style: semiBoldTextStyle(fontSize: dimen11.sp, color: AppColors.col007FC4),
                                          ),
                                        ),
                                        SvgPicture.asset(Assets.svg.locationOn),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Scallop row placed above the container
                        Positioned(
                          top: widget.maxHeight * 0.01,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(12, (index) {
                              return Container(
                                width: 20,
                                height: 10,
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFD6ECFF),
                                  shape: BoxShape.circle,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                height: constraintsHeight * 0.75,
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
                              Expanded(
                                  child: Text("Role sync-up meeting with the authorities",
                                      style: regularTextStyle(
                                          fontSize: dimen18.sp, color: AppColors.colBlack.withOpacity(0.5)))),
                              SvgPicture.asset(
                                Assets.svg.calendarClock1,
                                height: 18.h,
                                width: 18.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(5.sp),
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
                                        "TUE | 14 Jan 2025",
                                        style: regularTextStyle(fontSize: dimen9.sp, color: AppColors.col004576),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(5.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: AppColors.colE2F1FA,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.svg.alarm,
                                        height: 11.h,
                                        width: 11.w,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        "12:00 - 15:30 EST",
                                        style: regularTextStyle(fontSize: dimen9.sp, color: AppColors.col004576),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                              Assets.svg.apartment,
                              colorFilter: ColorFilter.mode(AppColors.col007FC4, BlendMode.srcIn),
                              height: 23.h,
                              width: 23.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                "Zen Office Inc, Round Rock, Texas",
                                style: semiBoldTextStyle(fontSize: dimen15.sp, color: AppColors.col007FC4),
                              ),
                            ),
                            SvgPicture.asset(
                              Assets.svg.locationOn,
                              height: 18.h,
                              width: 18.w,
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
