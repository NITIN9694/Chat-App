import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/routes/app_pages.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientListWidget extends StatefulWidget {
  const ClientListWidget({super.key});

  @override
  State<ClientListWidget> createState() => _ClientListWidgetState();
}

class _ClientListWidgetState extends State<ClientListWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.all(12.h),
              margin: EdgeInsets.symmetric(
                  vertical: index == 0 ? 2.h : 10.h, horizontal: 3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: AppColors.colWhite,
                boxShadow: AppCommonWidgets().commonBoxShadow(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 19.w, vertical: 22.h),
                        decoration: BoxDecoration(
                            color: AppColors.colE3F,
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: SvgPicture.asset(
                          Assets.svg.checkedBag,
                          height: 22.h,
                          width: 22.w,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Assigned",
                              style: mediumTextStyle(
                                  fontSize: 11.sp, color: AppColors.col4100),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Data Entry Associate",
                              style: mediumTextStyle(
                                  fontSize: 15.sp, color: AppColors.colBlack),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Divider(
                              // <-- Safe divider with no overflow
                              height: 1.h,
                              thickness: 0.5.h,
                              color: AppColors.col6666.withOpacity(0.4),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            jobIconWithData(Assets.svg.explore, "Texas | USA"),
                            SizedBox(
                              height: 5.h,
                            ),
                            jobIconWithData(Assets.svg.captivePortal,
                                "zen_office.com/carrers"),
                            SizedBox(
                              height: 5.h,
                            ),
                            jobIconWithData(Assets.svg.workHistory,
                                "View working conditions -->"),
                          ],
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.jobDetailPage);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                      height: _isExpanded ? 100.h : 0, // Animate height
                      child: _isExpanded
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "client info".toUpperCase(),
                                    style: boldTextStyle(
                                        fontSize: dimen10,
                                        color: AppColors.col6666),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.colF7F7,
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/image/male_2.png",
                                          fit: BoxFit.contain,
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "John Wills",
                                                style: regularTextStyle(
                                                    fontSize: dimen15.sp,
                                                    color: AppColors.col6666),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      Assets.svg.call),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Text(
                                                    "+1 (505) 654 - 8752",
                                                    style: lightTextStyle(
                                                        fontSize: dimen12.sp,
                                                        color:
                                                            AppColors.col6666),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget jobIconWithData(String icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          height: 12.h,
          width: 12.w,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          text,
          style: lightTextStyle(fontSize: 9.sp, color: AppColors.col6666),
        )
      ],
    );
  }
}
