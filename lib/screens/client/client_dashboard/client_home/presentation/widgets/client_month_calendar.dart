


import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ScrollableMonthCalendar extends StatefulWidget {
  @override
  State<ScrollableMonthCalendar> createState() => _ScrollableMonthCalendarState();
}

class _ScrollableMonthCalendarState extends State<ScrollableMonthCalendar> {
  final DateTime today = DateTime.now();

  late List<DateTime> monthDates;

  final ScrollController _scrollController = ScrollController();

  // Generate all dates for a month
  List<DateTime> getMonthDates(DateTime date) {
    final first = DateTime(date.year, date.month, 1);
    final last = DateTime(date.year, date.month + 1, 0);
    return List.generate(
      last.day,
          (i) => DateTime(date.year, date.month, i + 1),
    );
  }

  @override
  void initState() {
    super.initState();
    monthDates = _generateMonthDates(today);

    // Auto-scroll to today after layout is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int todayIndex = today.day - 1;
      double itemWidth = 60.0; // Width of each date item with padding
      _scrollController.jumpTo((todayIndex * itemWidth) - 16); // scroll with margin
    });
  }
  List<DateTime> _generateMonthDates(DateTime date) {
    final first = DateTime(date.year, date.month, 1);
    final last = DateTime(date.year, date.month + 1, 0);
    return List.generate(last.day, (i) => DateTime(date.year, date.month, i + 1));
  }

  @override
  Widget build(BuildContext context) {
    final monthDates = getMonthDates(today);

    return SizedBox(
      height: MediaQuery.of(context).size.height*0.1,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: monthDates.length,
        itemBuilder: (context, index) {
          final date = monthDates[index];
          final isToday = date.day == today.day &&
              date.month == today.month &&
              date.year == today.year;
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 7.w,vertical: 4.h),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.h,vertical: 4.h),
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width*0.075,
                  decoration: BoxDecoration(
                    boxShadow:  AppCommonWidgets().commonBoxShadow(),

                    gradient: isToday
                        ? LinearGradient(colors: [

                      AppColors.colDBF0FF,
                      AppColors.col27A6EC
                    ],
                    begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    )
                        : null,
                    color: isToday ? null : Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date.day.toString().padLeft(2, '0'),
                        style: regularTextStyle(
                          color: isToday ? Colors.white : AppColors.col6666,

                          fontSize: 11.sp,
                        ),
                      ),

                        const Icon(Icons.circle,
                            size: 6, color: Colors.white),
                    ],
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
