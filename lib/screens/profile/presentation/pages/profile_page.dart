import 'dart:developer';

import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/client_detail/presentation/widgets/assigned_task_list.dart';
import 'package:endeavors/screens/client_detail/presentation/widgets/assigned_training_list.dart';
import 'package:endeavors/screens/client_detail/presentation/widgets/job_detail_tile.dart';
import 'package:endeavors/screens/profile/bloc/profile_bloc.dart';
import 'package:endeavors/screens/profile/presentation/widgets/profile_emloyement_condition.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/employement_goals_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(LoadedEmploymentConditionsData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.col007FC4,
        body: LayoutBuilder(builder: (context,constraints){
          final double constraintsHeight = constraints.maxHeight;
          final double constraintsWidth = constraints.maxWidth;
          double width = MediaQuery.of(context).size.width;
          print("width ${width}");
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: AppCommonWidgets().commonAppBar(context, "Profile"),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //user profile tile

                            Container(
                              padding: EdgeInsets.all(15.sp),
                              decoration: BoxDecoration(
                                color: AppColors.colWhite,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: AppCommonWidgets().commonBoxShadow(),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Client",
                                            style: regularTextStyle(
                                                fontSize: dimen8.sp,
                                                color: AppColors.col718E),
                                          ),
                                          Text(
                                            "Jhon Mills",
                                            style: mediumTextStyle(
                                                fontSize: dimen11.sp,
                                                color: AppColors.col718E),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Work Shift",
                                            style: regularTextStyle(
                                                fontSize: dimen8.sp,
                                                color: AppColors.col718E),
                                          ),
                                          Text(
                                            "12:00-15:30 EST",
                                            style: mediumTextStyle(
                                                fontSize: dimen11.sp,
                                                color: AppColors.col718E),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 3.h,
                                          width: 3.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.col007616),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "employed".toUpperCase(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: semiBoldTextStyle(
                                                fontSize: dimen9.sp,
                                                color: AppColors.col007616),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),

                            BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, state) {
                                log("State ${state}");
                                if (state is EmploymentConditionsLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is EmploymentConditionsLoaded) {
                                  double containerHeight =
                                  state.isEmploymentConditionsExpanded
                                      ? state.profileEmploymentConditionsModel
                                      .length *
                                      70.h // estimate height per item
                                      : 0.0;
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context.read<ProfileBloc>().add(
                                              ToggleEmploymentConditionsExpansion());
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Employment Conditions",
                                              style: regularTextStyle(
                                                  fontSize: dimen16.sp,
                                                  color: AppColors.col333),
                                            ),
                                            SvgPicture.asset(
                                              state.isEmploymentConditionsExpanded
                                                  ? Assets.svg.keyboardArrowUp
                                                  : Assets.svg.keyboardArrowDown,
                                              height: 8.h,
                                              width: 8.w,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      AnimatedSize(
                                          curve: Curves.easeOutBack,
                                          duration: Duration(milliseconds: 900),
                                          child: state
                                              .isEmploymentConditionsExpanded
                                              ? ListView.builder(
                                              physics:
                                              NeverScrollableScrollPhysics(),
                                              itemCount: state
                                                  .profileEmploymentConditionsModel
                                                  .length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      top: index == 0
                                                          ? 0.0
                                                          : 8.h),
                                                  child:
                                                  ProfileEmploymentConditionWidget(
                                                    status: state
                                                        .profileEmploymentConditionsModel[
                                                    index]
                                                        .status,
                                                    svgIcons: state
                                                        .profileEmploymentConditionsModel[
                                                    index]
                                                        .svgImage,
                                                    title: state
                                                        .profileEmploymentConditionsModel[
                                                    index]
                                                        .title,
                                                    dataValue: state
                                                        .profileEmploymentConditionsModel[
                                                    index]
                                                        .dataValue,
                                                  ),
                                                );
                                              })
                                              : const SizedBox.shrink()),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      //Employment Goal
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<ProfileBloc>()
                                              .add(ToggleEmploymentGoals());
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Employment Goals",
                                              style: regularTextStyle(
                                                  fontSize: dimen16.sp,
                                                  color: AppColors.col333),
                                            ),
                                            SvgPicture.asset(
                                              state.isEmploymentGoalsExpanded
                                                  ? Assets.svg.keyboardArrowUp
                                                  : Assets.svg.keyboardArrowDown,
                                              height: 8.h,
                                              width: 8.w,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),

                                      AnimatedSize(
                                          curve: Curves.easeOutBack,
                                          duration: Duration(milliseconds: 900),
                                          child:
                                          state
                                              .isEmploymentGoalsExpanded
                                              ? ListView.builder(
                                              physics:
                                              NeverScrollableScrollPhysics(),
                                              itemCount: state
                                                  .profileEmploymentGoalModel
                                                  .length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:  EdgeInsets.only(top:index==0?0.0:8.h),
                                                  child: EmploymentGoalsWidget(
                                                    title: state.profileEmploymentGoalModel[index].title,
                                                    isExpanded: state.profileEmploymentGoalModel[index].isExpand,
                                                    date: state.profileEmploymentGoalModel[index].achievementDate,
                                                    desc: state.profileEmploymentGoalModel[index].summary,
                                                    onTap: (){
                                                      context.read<ProfileBloc>().add(ToggleEmploymentGoalsExpand(index));
                                                    },
                                                  ),
                                                );
                                              }):const SizedBox.shrink()),
                                    ],
                                  );
                                }
                                return Container(
                                  height: 200,
                                  color: Colors.orange,
                                );
                              },
                            )

                            //work location tile
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: width>=600?constraintsHeight * 0.27:constraintsHeight * 0.25,
                left: constraintsWidth * 0.25,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.svg.docIconJob),
                    SvgPicture.asset(Assets.svg.calIconJob),
                    SvgPicture.asset(Assets.svg.docChatJob),
                    SvgPicture.asset(Assets.svg.callIconJob),
                    SizedBox(
                      width: 1.w,
                    ),
                  ],
                ),
              )
            ],
          );
        }));
  }
}
