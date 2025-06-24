import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/screens/case_manager/case_manager_detail/presentation/widgets/assigned_training_list.dart';
import 'package:endeavors/screens/client/client_dashboard/client_home/presentation/widgets/client_appoinment_tile.dart';
import 'package:endeavors/screens/client/client_dashboard/client_home/presentation/widgets/client_interview_tile.dart';
import 'package:endeavors/screens/client/client_dashboard/client_home/presentation/widgets/client_training_tile.dart';
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
    if (width >= 600) return 260.h; // Small tablets
    return 220.h; // Phones
  }

  Widget getEventByIndex(index) {
    if (index == 0) {
      return ClientInterviewTile(widget.maxHeight,widget.maxWidth);
    } else if (index == 1) {
      return ClientInterviewTile(widget.maxHeight,widget.maxWidth);
    } else if (index == 2) {
      return ClientTrainingTile(widget.maxHeight,widget.maxWidth);
    } else if (index == 3) {
      return ClientAppointmentTile(widget.maxHeight,widget.maxWidth);
    } else {
      return Container();
    }
  }







}
