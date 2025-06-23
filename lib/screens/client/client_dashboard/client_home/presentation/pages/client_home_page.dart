
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/routes/app_pages.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/infrastructure/utils/app_menu_bar.dart';
import 'package:endeavors/screens/case_manager/main_page/presentation/main_page.dart';
import 'package:endeavors/screens/client/client_dashboard/client_home/presentation/widgets/client_month_calendar.dart';
import 'package:endeavors/screens/client/client_dashboard/client_home/presentation/widgets/clinet_home_event_tile.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  final DateTime today = DateTime.now();
  final List<DateTime> dateList = List.generate(
    7,
        (index) => DateTime.now().subtract(Duration(days: 3 - index)), // 3 days before to 3 days after today
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: LayoutBuilder(builder: (context,constraints){
       final double constraintsHeight = constraints.maxHeight;
       final double constraintsWidth = constraints.maxWidth;
       double width = MediaQuery.of(context).size.width;
       return Padding(padding: EdgeInsets.all(20.h),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             AppMenuBar(),
             SizedBox(
               height: 35.h,
             ),
             Expanded(
               child: SingleChildScrollView(
                 child: Stack(
                   children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
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
                                   Text("Hello! John",
                                       style: semiBoldTextStyle(
                                           fontSize: dimen16.sp,
                                           color: AppColors.col007FC4)),
                                   Text("I’m Jenna your case manager happy to help 🤍",
                                       style: regularTextStyle(
                                           fontSize: dimen8.sp,
                                           color: AppColors.col004576)),
               
                                 ],
                               ),
               
                             ],
                           ),
                         ),
                         //Work Place Location
                         Container(
                           padding: EdgeInsets.all(15.sp),
                           margin: EdgeInsets.only(top: constraintsHeight*0.05),
                           decoration: BoxDecoration(
                             color: AppColors.colWhite,
                             borderRadius: BorderRadius.circular(10.r),
                             boxShadow:
                             AppCommonWidgets().commonBoxShadow(),
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Text("CURRENT PLACEMENT",
                                   style: regularTextStyle(fontSize: dimen8.sp, color: AppColors.col6666),
                                   ),
                                   SvgPicture.asset(Assets.svg.badge)
                                 ],
                               ),
                               SizedBox(height: 10.h,),
                               Text("Employer Name XYZ Pvt. Ltd.",
                               style: mediumTextStyle(fontSize: dimen12.sp, color: AppColors.col007FC4),
                               ),
                               SizedBox(height: 10.h,),
               
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   SvgPicture.asset(Assets.svg.apartment,
                                     colorFilter: ColorFilter.mode(AppColors.col6666, BlendMode.srcIn),),
                                   SizedBox(width: 5.w,),
                                   Expanded(
                                     child: Text("6363 De Zavala Rd, San Antonio, TX 7824949",
                                       style: lightTextStyle(fontSize: dimen11.sp, color: AppColors.col6666),
                                     ),
                                   ),
               
                                   SvgPicture.asset(Assets.svg.locationOn),
               
                                 ],
                               ),
                               SizedBox(height: 10.h,),
                                Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3.r),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.col6666.withOpacity(0.1)),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(Assets.svg.alarm),
                                      SizedBox(width: 3.w,),
                                      Text("12:00 - 15:30 EST",
                                        style: regularTextStyle(fontSize: dimen9.sp, color: AppColors.col718E),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  padding: EdgeInsets.all(3.r),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.col6666.withOpacity(0.1)),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(Assets.svg.alarm),
                                      SizedBox(width: 3.w,),
                                      Text("12:00 - 15:30 EST",
                                        style: regularTextStyle(fontSize: dimen9.sp, color: AppColors.col718E),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                               SizedBox(height: 10.h,),
                               Container(
                                 padding: EdgeInsets.all(8.r),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10.r),
                                   color: AppColors.col004576.withOpacity(0.1),
                                   
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     SvgPicture.asset(Assets.svg.call,        colorFilter: ColorFilter.mode(AppColors.col007FC4, BlendMode.srcIn)),
                                     SizedBox(
                                       width: 4.w,
                                     ),
                                     Text("Call Your Supervisor",
                                     style: semiBoldTextStyle(fontSize: dimen12.sp, color: AppColors.col007FC4),
                                     ),
                                     Spacer(),
                                     Text("+1 (505) 654 - 8752",
                                     style: mediumTextStyle(fontSize: dimen12.sp, color: AppColors.col6666),
                                     )
                                   ],
                                   
                                 ),
                               )
                             ],
                           ),
                         ),
                         //Calender View
               
                         Padding(
                           padding:  EdgeInsets.symmetric(vertical: 10.h),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   RichText(text: TextSpan(
                                     children: [
                                       TextSpan(text: "My Calendar",style:semiBoldTextStyle(fontSize: dimen16.sp, color: AppColors.colBlack)),
                                       TextSpan(text: " | Today ${DateFormat('EEE, MMM d').format(today)} ",style:regularTextStyle(fontSize: dimen12.sp, color: AppColors.colBlack))
               
                                     ]
                                   )),
                                   Text("View ↗",
                                   style: regularTextStyle(fontSize: dimen12.sp, color: AppColors.col004576),
                                   )
                                 ],
                               ),
                               SizedBox(
                                 height: 10.h,
                               ),
                               ScrollableMonthCalendar()
               
                             ],
                           ),
                         ),
               
                         //Event Title
                         ClientHomeEventTile(),
               
                       ],
                     ),
                     Positioned(
                       top: width>=600?constraintsHeight * 0.12:constraintsHeight * 0.11,
                       left: constraintsWidth * 0.55,
                       right: 0,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
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
                 ),
               ),
             )
           ],
         ),
       );
     }),

    );
  }

  Widget _navIcon(VoidCallback onTap, String asset) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(asset),
    );
  }
}
