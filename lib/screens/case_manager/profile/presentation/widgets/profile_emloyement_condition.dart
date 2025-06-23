

import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileEmploymentConditionWidget extends StatelessWidget {
  String svgIcons;
  String title;
  String status;
  String  dataValue;
  ProfileEmploymentConditionWidget({super.key,required this.title,required this.status,required this.dataValue,required this.svgIcons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.col1E1E.withOpacity(0.1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            svgIcons,
            height: 13.h,
            width: 13.h,
          ),
          SizedBox(width: 8.w),

          // Left Side (icon + text)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: regularTextStyle(
                    fontSize: dimen14.sp,
                    color: AppColors.col3388,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 4.h),
                Text(
                  "● $status",
                  style: regularTextStyle(
                    fontSize: 8.sp,
                    color: status == "Negotiable"
                        ? AppColors.col21B43
                        : AppColors.colF26806,
                  ),
                ),
              ],
            ),
          ),

          // Right Side (data value)
          SizedBox(width: 8.w),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100.w), // Adjust width if needed
            child: Text(
              dataValue,
              style: regularTextStyle(
                fontSize: dimen14.sp,
                color: AppColors.col007FC4,
              ),
              textAlign: TextAlign.end,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );

  }

}
