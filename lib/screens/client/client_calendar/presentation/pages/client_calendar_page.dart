
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/case_manager/dash_board/calendar/presentation/widgets/status_filter_chips.dart';
import 'package:endeavors/screens/case_manager/dash_board/case_manager/presentation/widget/search_text_filed.dart';
import 'package:endeavors/screens/client/client_dashboard/client_home/presentation/widgets/clinet_home_event_tile.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../styles/styles.dart';

class ClientCalendarPage extends StatefulWidget {
  const ClientCalendarPage({super.key});

  @override
  State<ClientCalendarPage> createState() => _ClientCalendarPageState();
}

class _ClientCalendarPageState extends State<ClientCalendarPage> {
  TextEditingController searchTopicController = TextEditingController();
  final PageController _controller = PageController(viewportFraction: 0.9);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.col007FC4,
      body: LayoutBuilder(builder: (context,constraints){
        final double constraintsHeight = constraints.maxHeight;
        final double constraintsWidth = constraints.maxWidth;
        return Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 20.h),
                AppCommonWidgets().commonAppBar(context, 'Calendar'),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  padding: EdgeInsets.all(5.r),
                  width: constraintsWidth*0.5,
                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      border: Border.all(color: AppColors.colWhite.withOpacity(0.50),width: 2)
                  ),
                  child:Row(
                    children: [
                      SvgPicture.asset(Assets.svg.alarm,
                      height:20.h,
                        width: 20.w,
                        colorFilter: ColorFilter.mode(AppColors.colWhite, BlendMode.srcIn),
                      ),
                      SizedBox(width: 10.w,),
                      Text("12:00 - 15:30 EST",
                      style: semiBoldTextStyle(fontSize: dimen14.sp, color: AppColors.colWhite),
                      ),
                    ],
                  ),
                ),
                Text("My Work shift",
                  style: semiBoldTextStyle(
                    fontSize: 9.sp,
                    color: AppColors.colWhite.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
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
                          Center(
                            child: Container(
                              height: 5,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: AppColors.colaCADBC.withOpacity(0.2)
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          SearchTextFiled(
                            hintText: "Search  here",
                            controller: searchTopicController,
                          ),
                          SizedBox(height: 28.h),


                          ClientHomeEventTile(constraintsHeight, constraintsWidth),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        );
      })
    );
  }

  double getHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width >= 900) return 350.h; // Large tablets
    if (width >= 600) return 250.h; // Small tablets
    return 240.h; // Phones
  }
}
