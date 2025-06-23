import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AssignedTaskList extends StatelessWidget {
  const AssignedTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    return SizedBox(
      height: 160.h,
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
                    margin:
                        EdgeInsets.only(top: 10.h, left: index == 0 ? 0.w : 10),
                    decoration: BoxDecoration(
                        color: AppColors.colFAFAFA,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: AppColors.col1E1E.withOpacity(0.1))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: BoxDecoration(
                                      color: AppColors.colD9F4FF,
                                      shape: BoxShape.circle),
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
                                      style: boldTextStyle(
                                          color: AppColors.col232323,
                                          fontSize: 14.sp),
                                    ),
                                    Text(
                                      "Due By: 10 Jan 2025",
                                      style: lightTextStyle(
                                          color: AppColors.col718E,
                                          fontSize: 10.sp),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                      color:
                                          AppColors.col268E2D.withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.circular(8.sp)),
                                  child: Center(
                                    child: Text(
                                      "NEW",
                                      style: lightTextStyle(
                                          color: AppColors.col268E2D,
                                          fontSize: 10.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.all(12.h),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1.sp),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(2.h),
                                    border: Border.all(
                                        color: AppColors.col6C7, width: 1.w),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.done,
                                        color: Colors.transparent, size: 8.h),
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
    );
  }
}
