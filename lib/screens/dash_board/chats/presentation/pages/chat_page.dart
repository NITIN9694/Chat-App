

import 'package:endeavors/infrastructure/utils/app_menu_bar.dart';
import 'package:endeavors/screens/dash_board/client/presentation/widget/search_text_filed.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/chat_list.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _chatSearchTextEditingController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colBg,
        body: Padding(
          padding: EdgeInsets.only(left: 20.w,right: 20.w, top: 20.h),
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
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assigned Client List",
                        style: mediumTextStyle(
                            fontSize: 16.sp, color: AppColors.col333),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: SearchTextFiled(
                          hintText: "Search here",
                          controller: _chatSearchTextEditingController,
                        ),
                      ),

                      ChatList(),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
