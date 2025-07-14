import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/case_manager/chat_detail/presentation/widgets/chat_bubble_list.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientChatDetailPage extends StatefulWidget {
  const ClientChatDetailPage({super.key});

  @override
  State<ClientChatDetailPage> createState() => _ClientChatDetailPageState();
}

class _ClientChatDetailPageState extends State<ClientChatDetailPage> {
  TextEditingController _chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.col007FC4,
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: AppCommonWidgets().commonAppBar(context, "Chat Support"),
          ),
          SizedBox(height: 20.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:
                    "The chat is end to end encrypted for security reasons Refer",
                style: lightTextStyle(
                    fontSize: dimen12.sp,
                    color: AppColors.colWhite.withOpacity(0.8)),
                children: <TextSpan>[
                  TextSpan(
                      text: " Privacy Policy.",
                      style: TextStyle(
                          fontSize: dimen12.sp,
                          color: AppColors.colWhite.withOpacity(0.8),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400,
                          fontFamily: "InterRegular"))
                ]),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/image/male_1.png'),
                        radius: 25.r,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("John Wills",
                                style: mediumTextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.col007FC4)),
                            Text("Case Manager",
                                style: regularTextStyle(
                                    fontSize: 8.sp,
                                    color: AppColors.col007FC4)),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 16.h),


                  SizedBox(height: 20.h),

                  /// Chat Bubbles
                  // ChatBubbleList(),

                  /// Input bar
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: AppColors.colPrimary, // Light blue background
                      borderRadius:
                          BorderRadius.circular(40.sp), // Fully rounded edges
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _chatController,
                            style: regularTextStyle(
                              fontSize: dimen14.sp,
                              color: AppColors.colPrimary, // Text color
                            ),
                            decoration: InputDecoration(
                              hintText: "Tell us what happened . . .",
                              hintStyle: lightTextStyle(
                                fontSize: dimen12.sp,
                                color: AppColors.colBlack, //
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                       SvgPicture.asset(Assets.svg.send)
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
