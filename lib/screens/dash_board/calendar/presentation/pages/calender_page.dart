
import 'package:endeavors/screens/dash_board/calendar/presentation/widgets/status_filter_chips.dart';
import 'package:endeavors/screens/dash_board/client/presentation/widget/search_text_filed.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  TextEditingController searchTopicController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.col007FC4,
      body: Stack(
        children: [
          Positioned(
            top: 25.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Calendar",
                style: mediumTextStyle(fontSize: 16.sp, color: AppColors.colWhite),
                ),
              ],
            ),
          ),
          Positioned(
            top: 90.h,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: AppColors.colWhite,
                borderRadius: BorderRadius.only(topRight: Radius.circular(40.sp),topLeft: Radius.circular(40.sp))
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 15.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("View calendar of",
                      style: mediumTextStyle(fontSize: dimen12, color: AppColors.col6666),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:12.w,vertical: 8.h),


                        decoration: BoxDecoration(
                          color:  AppColors.colE2F1FA,
                          borderRadius: BorderRadius.circular(20.sp)
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Myself",
                              style: lightTextStyle(fontSize: dimen14.sp, color: AppColors.col007FC4),
                              ),
                              Icon(Icons.arrow_drop_down,color: AppColors.col007FC4,)
                            ],
                          ),
                        ),
                      ),
                   TableCalendar(
                    focusedDay:  DateTime.now(),
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2101),

                    // selectedDayPredicate: (day) {
                    //   return ;
                    // },
                    // enabledDayPredicate: (day) {
                    //   return day.isAfter(
                    //       DateTime.now().subtract(const Duration(days: 1)));
                    // },
                    rangeSelectionMode: RangeSelectionMode.toggledOn,
                    // rangeStartDay: controller.rangeStartDate.value,
                    // rangeEndDay: controller.rangeEndDate.value,

                    // Handle date selection
                    onDaySelected: (selectedDay, focusedDay) {
                      // if (controller.rangeStartDate.value != null &&
                      //     controller.rangeEndDate.value == null &&
                      //     selectedDay.isAfter(controller.rangeStartDate.value!)) {
                      //   controller.rangeEndDate.value = selectedDay;
                      // } else {
                      //   controller.rangeStartDate.value = selectedDay;
                      //   controller.rangeEndDate.value = null;
                      // }
                      // controller.focusedDate.value = focusedDay;
                    },

                    onRangeSelected: (start, end, focusedDay) {
                      // controller.rangeStartDate.value = start;
                      // controller.rangeEndDate.value = end;
                      // controller.focusedDate.value = focusedDay;
                    },

                    onPageChanged: (focusedDay) {

                    },

                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),

                    calendarStyle: CalendarStyle(
                      defaultDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      defaultTextStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      todayTextStyle: const TextStyle(color: Colors.black),
                      rangeHighlightColor: Colors.blue.withOpacity(0.5),
                      // Highlight for range
                      withinRangeTextStyle: const TextStyle(color: Colors.white),
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
                      SizedBox(
                        height: 8.h,
                      ),
                      SearchTextFiled(
                        hintText: "Search topic here",
                        controller: searchTopicController,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      // StatusFilterChips(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
