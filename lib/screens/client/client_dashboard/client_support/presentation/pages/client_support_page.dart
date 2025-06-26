import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ClientSupportPage extends StatefulWidget {
  const ClientSupportPage({super.key});

  @override
  State<ClientSupportPage> createState() => _ClientSupportPageState();
}

class _ClientSupportPageState extends State<ClientSupportPage> {
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
                "Support",
                style: semiBoldTextStyle(fontSize: dimen15.sp, color: AppColors.colWhite),
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
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/image/support.png",
                                height: 230.h,
                                width: 153.w,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: constraintsWidth * 0.4,
                                        height: constraintsHeight * 0.2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.r), color: AppColors.colBlack),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                          ),
                                        )),
                                  ],
                                ),
                              )
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
