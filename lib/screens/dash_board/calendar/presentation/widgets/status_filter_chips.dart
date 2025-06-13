import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StatusFilterChips extends StatefulWidget {
  const StatusFilterChips({Key? key}) : super(key: key);

  @override
  State<StatusFilterChips> createState() => _StatusFilterChipsState();
}

class _StatusFilterChipsState extends State<StatusFilterChips> {
  int selectedIndex = 1;

  final List<Map<String, dynamic>> filters = [
    {'label': 'All', 'count': 4},
    {'label': 'Interview', 'count': 1},
    {'label': 'Training', 'count': 3},
    {'label': 'Appointment', 'count': 2},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
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
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.colE2F1FA : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? AppColors.colE2F1FA
                      : Color(0xFF457626).withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    item['label'],
                    style: regularTextStyle(
                      color: isSelected
                          ? AppColors.col007FC4
                          : AppColors.col004576,
                      fontSize: 11.sp,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.col007FC4
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.col007FC4
                              : AppColors.col007FC4,
                        ),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        item['count'].toString(),
                        style: TextStyle(
                          fontSize: 11.sp,
                          color:
                              isSelected ? Colors.white : AppColors.col004576,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
