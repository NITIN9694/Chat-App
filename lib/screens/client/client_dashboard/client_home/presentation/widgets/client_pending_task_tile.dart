import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ClientPendingTaskTile extends StatefulWidget {
  double maxHeight;
  double maxWidth;
  ClientPendingTaskTile(this.maxHeight, this.maxWidth);

  @override
  State<ClientPendingTaskTile> createState() => _ClientPendingTaskTileState();
}

class _ClientPendingTaskTileState extends State<ClientPendingTaskTile> {
  final PageController _controller = PageController(viewportFraction: 0.9);
  bool isMark = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Pending Task", style: semiBoldTextStyle(fontSize: dimen16.sp, color: AppColors.colBlack)),
              SizedBox(
                width: 10.w,
              ),
              Container(
                padding: EdgeInsets.all(3.r),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.col004576)),
                child: Center(
                  child: Text(
                    "25",
                    style: regularTextStyle(fontSize: dimen8.sp, color: AppColors.col004576),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getHeight(context),
            // Enough height to include both PageView and indicator
            child: Column(
              children: [
                Expanded(
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
                              border: Border.all(color: AppColors.col1E1E.withOpacity(0.1))),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Padding(
                              padding: EdgeInsets.all(8.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.sp),
                                    decoration: BoxDecoration(color: AppColors.colD9F4FF, shape: BoxShape.circle),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        Assets.svg.alarmSmartWake,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Task title here",
                                        style: boldTextStyle(color: AppColors.col232323, fontSize: 14.sp),
                                      ),
                                      Text(
                                        "Due By: 10 Jan 2025",
                                        style: lightTextStyle(color: AppColors.col718E, fontSize: 10.sp),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                    decoration: BoxDecoration(
                                        color: AppColors.col268E2D.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8.sp)),
                                    child: Center(
                                      child: Text(
                                        "NEW",
                                        style: lightTextStyle(color: AppColors.col268E2D, fontSize: 10.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(12.h),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(1.sp),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(2.h),
                                        border: Border.all(color: AppColors.col6C7, width: 1.w),
                                      ),
                                      child: Center(
                                        child: Icon(Icons.done, color: Colors.transparent, size: 8.h),
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      "Mark Complete",
                                      style: regularTextStyle(
                                        fontSize: dimen11.sp,
                                        color: AppColors.col6C7,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]));
                    },
                  ),
                ),
                SizedBox(height: 10),
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
          )
        ],
      ),
    );
  }

  double getHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width >= 900) return widget.maxHeight * 0.3; // Large tablets
    if (width >= 600) return widget.maxHeight * 0.25; // Small tablets
    return widget.maxHeight * 0.22; // Phones
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                              Text("Task title here",
                                  style: semiBoldTextStyle(fontSize: dimen18.sp, color: AppColors.colBlack)),
                              SvgPicture.asset(Assets.svg.calendarClock1),
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
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Summary",
                                style: semiBoldTextStyle(fontSize: 12.sp, color: AppColors.col6C7),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.r),
                                margin: EdgeInsets.symmetric(vertical: 10.h),
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
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setModalState(() {
                          isMark = !isMark;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.colE1E1E1.withOpacity(0.2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Container(
                              padding: EdgeInsets.all(1.sp),
                              decoration: BoxDecoration(
                                color: isMark ? AppColors.col007FC4 : Colors.transparent,
                                borderRadius: BorderRadius.circular(2.h),
                                border: Border.all(color: isMark ? AppColors.col007FC4 : AppColors.col6C7, width: 1.w),
                              ),
                              child: Center(
                                child: Icon(Icons.done,
                                    color: isMark ? AppColors.colWhite : Colors.transparent, size: 12.h),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Mark Complete",
                              style: regularTextStyle(
                                fontSize: dimen18.sp,
                                color: AppColors.col6C7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: AppColors.col007FC4,
                        ),
                        child: Center(
                          child: Text(
                            "Okay",
                            style: semiBoldTextStyle(fontSize: dimen14.sp, color: AppColors.colWhite),
                          ),
                        ),
                      ),
                    )),
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
