import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/screens/case_manager/case_manager_detail/presentation/widgets/assigned_training_list.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../styles/styles.dart';

class ClientHomeEventTile extends StatefulWidget {
  double maxHeight;
  double maxWidth;
  ClientHomeEventTile(this.maxHeight, this.maxWidth);

  @override
  State<ClientHomeEventTile> createState() => _ClientHomeEventTileState();
}

class _ClientHomeEventTileState extends State<ClientHomeEventTile> {
  int selectedIndex = 1;

  final List<Map<String, dynamic>> filters = [
    {'label': 'All', 'count': 4},
    {'label': 'Interview', 'count': 1},
    {'label': 'Training', 'count': 3},
    {'label': 'Appointment', 'count': 2},
  ];
  final PageController _controller = PageController(viewportFraction: 0.9);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            itemCount: filters.length,
            separatorBuilder: (_, __) => SizedBox(width: 8.w),
            itemBuilder: (context, index) {
              final item = filters[index];
              final bool isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.colE2F1FA : Colors.transparent,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: isSelected ? AppColors.colE2F1FA : Color(0xFF457626).withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        item['label'],
                        style: regularTextStyle(
                          color: isSelected ? AppColors.col007FC4 : AppColors.col004576,
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                        decoration: BoxDecoration(
                            color: isSelected ? AppColors.col007FC4 : Colors.transparent,
                            border: Border.all(
                              color: isSelected ? AppColors.col007FC4 : AppColors.col007FC4,
                            ),
                            shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            item['count'].toString(),
                            style: lightTextStyle(
                              fontSize: 10.sp,
                              color: isSelected ? Colors.white : AppColors.col004576,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 5.h),
        getEventByIndex(selectedIndex),
      ],
    );
  }

  double getHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width >= 900) return 350.h; // Large tablets
    if (width >= 600) return 250.h; // Small tablets
    return 220.h; // Phones
  }

  Widget getEventByIndex(index) {
    if (index == 0) {
      return _interviewWidget();
    } else if (index == 1) {
      return _interviewWidget();
    } else if (index == 2) {
      return _trainingWidget();
    } else if (index == 3) {
      return _appointmentWidget();
    } else {
      return Container();
    }
  }

  Widget _interviewWidget() {
    return

        /// PageView section
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
                  margin: EdgeInsets.all(5.sp),
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.col007FC4),
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "First screening round",
                            style: mediumTextStyle(color: AppColors.col333, fontSize: 17.sp),
                          ),
                          SvgPicture.asset(Assets.svg.contacts),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: AppColors.colE2F1FA,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svg.calendarMonth,
                                    height: 11.h,
                                    width: 11.w,
                                  ),
                                  Text(
                                    "TUE | 14 Jan 2025",
                                    style: regularTextStyle(fontSize: dimen9.sp, color: AppColors.col004576),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: AppColors.colE2F1FA,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svg.alarm,
                                    height: 11.h,
                                    width: 11.w,
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
                      SizedBox(height: 10),
                      Text(
                        "You have an interview for Data Entry role... "
                        "The screening process shall determine the further progress.",
                        style: regularTextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: AppColors.colE2F1FA,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.svg.apartment,
                              height: 13.h,
                              width: 13.w,
                            ),
                            SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                "6363 De Zavala Rd, San Antonio, TX 78249",
                                style: regularTextStyle(fontSize: dimen10.sp, color: AppColors.col007FC4),
                              ),
                            ),
                            SvgPicture.asset(
                              Assets.svg.locationOn,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
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

  Widget _trainingWidget() {
    return SizedBox(
      height: getHeight(context),
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
                                decoration:
                                    BoxDecoration(color: AppColors.colWhite, borderRadius: BorderRadius.circular(10.r)),
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
                    ));
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

  Widget _appointmentWidget() {
    return SizedBox(
      height: widget.maxHeight * 0.5,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
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
                                top: 0, left: 100, right: 0, child: Image.asset("assets/image/calendar_clock.png")),
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
}
