import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/case_manager/job_details/presentation/widgets/job_detail_desc.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.col007FC4,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: AppCommonWidgets().commonAppBar(context, "Jobs"),
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
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Work Location
                        Container(
                          margin: EdgeInsets.only(top: 40.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 15.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: AppColors.col1E1E.withOpacity(0.1))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Work Location",
                                    style: semiBoldTextStyle(
                                        fontSize: dimen16.h,
                                        color: AppColors.col333),
                                  ),
                                  SvgPicture.asset(
                                    Assets.svg.locationOn,
                                    height: 20.h,
                                    width: 20.w,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svg.corporateFare,
                                    height: 15.h,
                                    width: 15.w,
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "6363 De Zavala Rd, San Antonio, TX 78249",
                                      style: semiBoldTextStyle(
                                          fontSize: dimen13.sp,
                                          color: AppColors.col6666),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svg.call,
                                    height: 15.h,
                                    width: 15.w,
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "+1 (505) 123 - 4567",
                                      style: semiBoldTextStyle(
                                          fontSize: dimen13.sp,
                                          color: AppColors.col6666),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //Job Detail
                        JobDetailDesc(),
                      ],
                    ),
                  ),
                ),
              )
            ]));
  }
}
