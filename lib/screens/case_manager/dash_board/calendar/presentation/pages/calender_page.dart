import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/screens/case_manager/dash_board/calendar/presentation/widgets/status_filter_chips.dart';
import 'package:endeavors/screens/case_manager/dash_board/case_manager/presentation/widget/search_text_filed.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  TextEditingController searchTopicController = TextEditingController();
  final PageController _controller = PageController(viewportFraction: 0.9);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.col007FC4,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  "Calendar",
                  style: mediumTextStyle(
                    fontSize: 16.sp,
                    color: AppColors.colWhite,
                  ),
                ),
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
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "View calendar of",
                          style: mediumTextStyle(
                            fontSize: dimen12.sp,
                            color: AppColors.col6666,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: AppColors.colE2F1FA,
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Myself",
                                style: lightTextStyle(
                                  fontSize: dimen14.sp,
                                  color: AppColors.col007FC4,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                                  color: AppColors.col007FC4),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        TableCalendar(
                          focusedDay: DateTime.now(),
                          firstDay: DateTime(2000),
                          lastDay: DateTime(2101),
                          rangeSelectionMode: RangeSelectionMode.toggledOn,
                          onDaySelected: (selectedDay, focusedDay) {},
                          onRangeSelected: (start, end, focusedDay) {},
                          onPageChanged: (focusedDay) {},
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                          ),
                          calendarStyle: CalendarStyle(
                            defaultDecoration:
                                const BoxDecoration(color: Colors.transparent),
                            defaultTextStyle:
                                const TextStyle(color: Colors.black),
                            todayDecoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            todayTextStyle:
                                const TextStyle(color: Colors.black),
                            rangeHighlightColor: Colors.blue.withOpacity(0.5),
                            withinRangeTextStyle:
                                const TextStyle(color: Colors.white),
                            selectedDecoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            selectedTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        SearchTextFiled(
                          hintText: "Search topic here",
                          controller: searchTopicController,
                        ),
                        SizedBox(height: 28.h),
                        StatusFilterChips(),
                        SizedBox(height: 28.h),

                        /// PageView section
                        Padding(
                          padding: EdgeInsets.only(bottom: 80.h),
                          child: SizedBox(
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
                                          border: Border.all(
                                              color: AppColors.col007FC4),
                                          borderRadius:
                                              BorderRadius.circular(18.r),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "First screening round",
                                                  style: mediumTextStyle(
                                                      color: AppColors.col333,
                                                      fontSize: 17.sp),
                                                ),
                                                SvgPicture.asset(
                                                    Assets.svg.contacts),
                                              ],
                                            ),
                                            SizedBox(height: 8.h),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(10.sp),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp),
                                                      color:
                                                          AppColors.colE2F1FA,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        SvgPicture.asset(
                                                          Assets.svg
                                                              .calendarMonth,
                                                          height: 11.h,
                                                          width: 11.w,
                                                        ),
                                                        Text(
                                                          "TUE | 14 Jan 2025",
                                                          style: regularTextStyle(
                                                              fontSize:
                                                                  dimen9.sp,
                                                              color: AppColors
                                                                  .col004576),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(10.sp),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp),
                                                      color:
                                                          AppColors.colE2F1FA,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        SvgPicture.asset(
                                                          Assets.svg.alarm,
                                                          height: 11.h,
                                                          width: 11.w,
                                                        ),
                                                        Text(
                                                          "12:00 - 15:30 EST",
                                                          style: regularTextStyle(
                                                              fontSize:
                                                                  dimen9.sp,
                                                              color: AppColors
                                                                  .col004576),
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
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
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
                                                      style: regularTextStyle(
                                                          fontSize: dimen10.sp,
                                                          color: AppColors
                                                              .col007FC4),
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
                                SizedBox(height: 10),
                                SmoothPageIndicator(
                                  controller: _controller,
                                  count: 3,
                                  effect: ExpandingDotsEffect(
                                    dotHeight: 8,
                                    dotWidth: 12,
                                    activeDotColor:
                                        AppColors.col6666.withOpacity(0.3),
                                    dotColor:
                                        AppColors.col6666.withOpacity(0.3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Positioned(
          //   bottom: MediaQuery.of(context).size.height*0.15,
          //
          //
          //   left: MediaQuery.of(context).size.width * 0.82,
          //   child: FloatingActionButton(
          //     backgroundColor: AppColors.col268E2D,
          //     onPressed: () {},
          //    shape: CircleBorder(),
          //     child: Icon(Icons.add,color: AppColors.colWhite,),
          //   ),
          // ),
        ],
      ),
    );
  }

  double getHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width >= 900) return 350.h; // Large tablets
    if (width >= 600) return 250.h; // Small tablets
    return 240.h; // Phones
  }
}
