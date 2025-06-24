import 'dart:developer';

import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif/gif.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ClientCourseLearnPage extends StatefulWidget {
  const ClientCourseLearnPage({super.key});

  @override
  State<ClientCourseLearnPage> createState() => _ClientCourseLearnPageState();
}

class _ClientCourseLearnPageState extends State<ClientCourseLearnPage>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  List<bool> completed = [true, true, true, false, false];
  late List<bool> showGif;
  late List<GifController> gifControllers;

  @override
  void initState() {
    showGif = List.generate(completed.length, (_) => false);
    gifControllers = List.generate(
      completed.length,
      (_) => GifController(
        vsync: this,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in gifControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void handleCheck(int index, bool? value) {
    setState(() {
      showGif[index] = true;
    });
    log("value ${value}");

    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() {
        showGif[index] = false;
        completed[index] = value!;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.col007FC4,
        body: LayoutBuilder(builder: (context, constraints) {
          final double constraintsHeight = constraints.maxHeight;
          final double constraintsWidth = constraints.maxWidth;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                  child: Text(
                "Learn",
                style: regularTextStyle(
                    fontSize: dimen15.sp, color: AppColors.colWhite),
              )),
              SizedBox(
                height: 20.h,
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
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Text(
                            "Overdue Trainings",
                            style: semiBoldTextStyle(
                                fontSize: dimen15.sp, color: AppColors.col333),
                          ),
                        ),
                        SizedBox(
                          height: constraintsHeight * 0.4,
                          child: Column(
                            children: [
                              Expanded(
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: completed.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // _showBottomSheet(context);
                                      },
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.only(
                                              top: 10.h,
                                              left: index == 0 ? 0.w : 10),
                                          decoration: BoxDecoration(
                                            color: AppColors.colFAFAFA,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            gradient: LinearGradient(
                                                colors: [
                                                  AppColors.col2D60FF,
                                                  AppColors.col539BFF,
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.w,
                                                    left: 10.w,
                                                    right: 10.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Basic Work Ethics",
                                                          style: semiBoldTextStyle(
                                                              fontSize:
                                                                  dimen16.sp,
                                                              color: AppColors
                                                                  .colWhite),
                                                        ),
                                                        Text(
                                                          "14:30 minutes",
                                                          style: regularTextStyle(
                                                              fontSize:
                                                                  dimen11.sp,
                                                              color: AppColors
                                                                  .colBlack
                                                                  .withOpacity(
                                                                      0.5)),
                                                        ),
                                                      ],
                                                    ),
                                                    Image.asset(
                                                        "assets/image/autoplay.png")
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                child: Text(
                                                  "Due By",
                                                  style: lightTextStyle(
                                                      fontSize: dimen10.sp,
                                                      color:
                                                          AppColors.colWhite),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "12 Jan 2025",
                                                      style: semiBoldTextStyle(
                                                          fontSize: dimen16.sp,
                                                          color: AppColors
                                                              .colWhite),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Text(
                                                      "⚠️ 4 days overdue",
                                                      style: lightTextStyle(
                                                          fontSize: dimen10.sp,
                                                          color: AppColors
                                                              .colFFCD00),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 60.h,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        AppColors.colWhite
                                                            .withOpacity(0.2),
                                                        AppColors.colWhite
                                                            .withOpacity(0.2),
                                                      ],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end: Alignment
                                                          .centerRight),
                                                  color: AppColors.colWhite,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.h),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.h)),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Checkbox(
                                                      value: completed[index],
                                                      onChanged: (val) {
                                                        setState(() {
                                                          completed[index] =
                                                              val!;
                                                        });
                                                      },
                                                      activeColor:
                                                          AppColors.colWhite,
                                                      checkColor:
                                                          AppColors.col007FC4,
                                                      side: BorderSide(
                                                          color: AppColors
                                                              .colWhite),
                                                    ),
                                                    Text("Mark As Done",
                                                        style: regularTextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                dimen10.sp)),
                                                    Spacer(),
                                                    Container(
                                                      width: 120.w,
                                                      height: 35.h,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .colWhite,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Take The Course",
                                                            style: mediumTextStyle(
                                                                fontSize:
                                                                    dimen10.sp,
                                                                color: AppColors
                                                                    .col007FC4),
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          SvgPicture.asset(
                                                            Assets.svg.resume,
                                                            height: 15.h,
                                                            width: 15.w,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: 3,
                                effect: ExpandingDotsEffect(
                                  dotHeight: 8,
                                  dotWidth: 12,
                                  activeDotColor:
                                      AppColors.col6666.withOpacity(0.3),
                                  dotColor: AppColors.col6666.withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          color: AppColors.colF5F5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //  Assigned Trainings
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text("Assigned Trainings",
                                    style: semiBoldTextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.colBlack)),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(16.r),
                                  itemCount: completed.length,
                                  itemBuilder: (_, index) => Container(
                                      margin: EdgeInsets.only(bottom: 12.h),
                                      padding: EdgeInsets.all(12.r),
                                      decoration: BoxDecoration(
                                        color: AppColors.colWhite,
                                        boxShadow: AppCommonWidgets()
                                            .commonBoxShadow(),
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: Row(children: [
                                        Container(
                                          padding: EdgeInsets.all(10.r),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: AppColors.colE7EDFF),
                                          child: Center(
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: AppColors.col396AFF,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Business values and its impact ",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: regularTextStyle(
                                                      color: AppColors.colBlack,
                                                      fontSize: dimen15.sp)),
                                              Text(
                                                completed[index]
                                                    ? "Completed Date: 12 Jan 2025"
                                                    : "Due By: 12 Jan 2025",
                                                style: regularTextStyle(
                                                    color: AppColors.col718E,
                                                    fontSize: dimen11.sp),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //if course complete then show gif after that show checkbox

                                        SizedBox(
                                          height: 50.h,
                                          width: 50.w,
                                          child: Stack(
                                            alignment: Alignment.center,

                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    completed[index] =
                                                    !completed[index];

                                                  });
                                                  handleCheck(
                                                      index, completed[index]);
                                                },
                                                child: Container(
                                                  height: 20.h,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          2.r),
                                                      color: completed[index]
                                                          ? AppColors.col268E2D
                                                          : AppColors.colWhite,
                                                      border: Border.all(
                                                          color: completed[index]
                                                              ? AppColors
                                                              .col268E2D
                                                              : AppColors
                                                              .colBlack)),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.done,
                                                      color: AppColors.colWhite,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (showGif[index] &&  completed[index])
                                                Positioned.fill(
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Opacity(
                                                      opacity: 0.7,
                                                      child: Gif(
                                                        duration: Duration(
                                                            seconds: 2),
                                                        onFetchCompleted: () {
                                                          gifControllers[index]
                                                              .reset();
                                                          gifControllers[index]
                                                              .forward();
                                                        },
                                                        controller:
                                                        gifControllers[
                                                        index],
                                                        image: const AssetImage(
                                                          'assets/image/check_gif.gif',
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        )
                                      ])))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }));
  }
}
