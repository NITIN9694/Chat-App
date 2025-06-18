import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/routes/app_pages.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/client_detail/presentation/widgets/assigned_task_list.dart';
import 'package:endeavors/screens/client_detail/presentation/widgets/assigned_training_list.dart';
import 'package:endeavors/screens/client_detail/presentation/widgets/job_detail_tile.dart';
import 'package:endeavors/screens/main_page/presentation/main_page.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ClientPageDetail extends StatefulWidget {
  const ClientPageDetail({super.key});

  @override
  State<ClientPageDetail> createState() => _ClientPageDetailState();
}

class _ClientPageDetailState extends State<ClientPageDetail> {
  final PageController _controller = PageController(viewportFraction: 1.0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.col007FC4,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double constraintsHeight = constraints.maxHeight;
            final double constraintsWidth = constraints.maxWidth;
            double width = MediaQuery.of(context).size.width;
            print("width ${width}");

            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child:
                          AppCommonWidgets().commonAppBar(context, "Clients"),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 25.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // User Profile Tile
                              Container(
                                padding: EdgeInsets.all(15.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.colWhite,
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow:
                                      AppCommonWidgets().commonBoxShadow(),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 60.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.colF5F5,
                                      ),
                                      child: Image.asset(
                                        "assets/image/male_2.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Client",
                                            style: regularTextStyle(
                                                fontSize: dimen8.sp,
                                                color: AppColors.col718E)),
                                        Text("Jhon Mills",
                                            style: mediumTextStyle(
                                                fontSize: dimen11.sp,
                                                color: AppColors.col718E)),
                                        SizedBox(height: 6.h),
                                        Text("Work Shift",
                                            style: regularTextStyle(
                                                fontSize: dimen8.sp,
                                                color: AppColors.col718E)),
                                        Text("12:00-15:30 EST",
                                            style: mediumTextStyle(
                                                fontSize: dimen11.sp,
                                                color: AppColors.col718E)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 3.h,
                                              width: 3.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.col007616,
                                              ),
                                            ),
                                            SizedBox(width: 3.w),
                                            Text(
                                              "employed".toUpperCase(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: semiBoldTextStyle(
                                                fontSize: dimen9.sp,
                                                color: AppColors.col007616,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              // Work Location
                              Container(
                                margin: EdgeInsets.only(top: 40.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25.w, vertical: 15.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      color:
                                          AppColors.col1E1E.withOpacity(0.1)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Work Location",
                                            style: semiBoldTextStyle(
                                                fontSize: dimen16.sp,
                                                color: AppColors.col333)),
                                        SvgPicture.asset(Assets.svg.locationOn,
                                            height: 20.h, width: 20.w),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            Assets.svg.corporateFare,
                                            height: 15.h,
                                            width: 15.w),
                                        SizedBox(width: 7.w),
                                        Expanded(
                                          child: Text(
                                            "6363 De Zavala Rd, San Antonio, TX 78249",
                                            style: semiBoldTextStyle(
                                                fontSize: dimen13.sp,
                                                color: AppColors.col6666),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 7.h),
                                    Row(
                                      children: [
                                        SvgPicture.asset(Assets.svg.call,
                                            height: 15.h, width: 15.w),
                                        SizedBox(width: 7.w),
                                        Text(
                                          "+1 (505) 123 - 4567",
                                          style: semiBoldTextStyle(
                                              fontSize: dimen13.sp,
                                              color: AppColors.col6666),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // Job Detail
                              JobDetailTile(),
                              SizedBox(height: 30.h),

                              // Assigned Tasks Header
                              _buildSectionHeader("Assigned Tasks", "25"),
                              AssignedTaskList(),
                              SizedBox(height: 30.h),

                              // Assigned Trainings Header
                              _buildSectionHeader("Assigned Trainings", "25"),
                              AssignedTrainingList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Bottom Navigation Overlay
                Positioned(
                  top: width>=600?constraintsHeight * 0.27:constraintsHeight * 0.25,
                  left: constraintsWidth * 0.25,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _navIcon(
                          () => Navigator.pushNamed(
                              context, AppRoutes.profilePage),
                          Assets.svg.docIconJob),
                      _navIcon(() {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MainPage(initialIndex: 1)),
                          (route) => false,
                        );
                      }, Assets.svg.calIconJob),
                      _navIcon(() {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MainPage(initialIndex: 2)),
                          (route) => false,
                        );
                      }, Assets.svg.docChatJob),
                      SvgPicture.asset(Assets.svg.callIconJob),
                      SizedBox(width: 1.w),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }

  Widget _buildSectionHeader(String title, String count) {
    return Row(
      children: [
        Text(
          title,
          style:
              semiBoldTextStyle(fontSize: dimen16.sp, color: AppColors.col333),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.all(3.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.col004576),
          ),
          child: Center(
            child: Text(
              count,
              style: lightTextStyle(
                  fontSize: dimen8.sp, color: AppColors.col004576),
            ),
          ),
        ),
      ],
    );
  }

  Widget _navIcon(VoidCallback onTap, String asset) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(asset),
    );
  }

  double getTapPost(
    BuildContext context,
      constraints
  ) {
    double width = MediaQuery.of(context).size.width;

    if (width >= 900) return 0.95;
    if (width >= 600) return 0.9;
    return 0.7.h;
  }
}
