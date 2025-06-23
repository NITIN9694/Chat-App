import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobDetailTile extends StatelessWidget {
  const JobDetailTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.col1E1E.withOpacity(0.1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                Assets.svg.checkedBag,
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(
                width: 7.w,
              ),
              Expanded(
                child: Text(
                  "Job Details",
                  style: regularTextStyle(
                      fontSize: dimen15.sp, color: AppColors.col6666),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "We are seeking a highly skilled and experienced Senior UI/UX Designer to join our dynamic team. As a Senior UI/UX Designer, you will play a pivotal role in driving the design strategy and creating exceptional user experiences across our digital platforms.",
            style:
                lightTextStyle(fontSize: dimen13.sp, color: AppColors.col6666),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Requirements:",
            style:
                boldTextStyle(fontSize: dimen14.sp, color: AppColors.col6666),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " • ",
                textAlign: TextAlign.start,
                style: lightTextStyle(
                    fontSize: dimen13.sp, color: AppColors.col6666),
              ),
              Expanded(
                child: Text(
                  "Bachelor's degree in Design, HCI, or equivalent work experience in UX/UI design.",
                  textAlign: TextAlign.start,
                  style: lightTextStyle(
                      fontSize: dimen13.sp, color: AppColors.col6666),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " • ",
                textAlign: TextAlign.start,
                style: lightTextStyle(
                    fontSize: dimen13.sp, color: AppColors.col6666),
              ),
              Expanded(
                child: Text(
                  "Strong portfolio showcasing user-focused designs, problem-solving, and modern design principles.",
                  textAlign: TextAlign.start,
                  style: lightTextStyle(
                      fontSize: dimen13.sp, color: AppColors.col6666),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " • ",
                textAlign: TextAlign.start,
                style: lightTextStyle(
                    fontSize: dimen13.sp, color: AppColors.col6666),
              ),
              Expanded(
                child: Text(
                  "Proficiency in tools like Figma, Sketch, Adobe XD, and prototyping software.",
                  textAlign: TextAlign.start,
                  style: lightTextStyle(
                      fontSize: dimen13.sp, color: AppColors.col6666),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
