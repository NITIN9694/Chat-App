import 'dart:developer';

import 'package:chat/gen/assets.gen.dart';
import 'package:chat/infrastructure/utils/app_common_widgets.dart';
import 'package:chat/screens/chat_detail/bloc/case_manager_chat_detail_bloc.dart';
import 'package:chat/screens/chat_detail/presentation/widgets/chat_bubble_list.dart';
import 'package:chat/screens/chat_detail/presentation/widgets/chat_loading_shimmer.dart';
import 'package:chat/screens/chat_detail/presentation/widgets/report_client_bottom_sheet.dart';
import 'package:chat/styles/colors.dart';
import 'package:chat/styles/sizes.dart';
import 'package:chat/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _chatController = TextEditingController();
  late ChatDetailBloc _chatBloc;

  @override
  void initState() {
    _chatBloc=  context.read<ChatDetailBloc>()..add(CheckUserEvent(
       caseManagerName: "casemanager",
      caseMangerId: "casemanager",
      clientId: "client12",
      clientName:"client12"
    ));

    super.initState();


  }

  @override
  void dispose() {
    _chatBloc.disConnect();

    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  style: regularTextStyle(
                      fontSize: dimen12.sp,
                      color: AppColors.colWhite.withOpacity(0.8)),
                  children: <TextSpan>[
                    TextSpan(
                        text: " Privacy Policy.",
                        style: TextStyle(
                            fontSize: dimen12.sp,
                            color: AppColors.colWhite.withOpacity(0.7),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
                            fontFamily: "InterRegular"))
                  ]),
            ),
            SizedBox(height: 20.h),
            BlocBuilder<ChatDetailBloc, CaseManagerChatDetailState>(
                builder: (context, state) {
              log("State :- $state}");
              if(state is SendMessageError){

                  }
              if (state is CheckUserLoadingState) {
                return ChatLoadingShimmer();
              } else if (state is CheckUserErrorState) {
                return Expanded(
                  child: Container(
                      padding: EdgeInsets.all(16.w),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.r)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Lottie.asset('assets/image/error.json',
                              height: 200.h),
                          Text(
                            "Something Went Wrong!",
                            style: boldTextStyle(
                                fontSize: dimen21, color: AppColors.col007FC4),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<ChatDetailBloc>()
                                  .add(
                                  CheckUserEvent(
                                      caseManagerName: "casemanager",
                                      caseMangerId: "casemanager",
                                      clientId: "client12",
                                      clientName:"client12"
                                  ));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.r),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.h, vertical: 20.h),
                              decoration: BoxDecoration(
                                  color: AppColors.col007FC4,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                child: Text(
                                  "Refresh",
                                  style: mediumTextStyle(
                                      fontSize: dimen18,
                                      color: AppColors.colWhite),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                );
              } else if (state is CheckUserLoadedState) {
                return Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30.r)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/image/male_2.png'),
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
                                  Text("Client",
                                      style: regularTextStyle(
                                          fontSize: 8.sp,
                                          color: AppColors.col007FC4)),
                                  Text((state.isUserOnline??false)?"Online":"Offline",
                                      style: mediumTextStyle(
                                          fontSize: 10.sp,
                                          color:(state.isUserOnline??false)?AppColors.col21B43: AppColors.colF26806)),
                                ],
                              ),
                            ),
                            Text("EMPLOYED",
                                style: mediumTextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.col007616)),
                          ],
                        ),


                        SizedBox(height: 20.h),

                        /// Chat Bubbles
                        ChatBubbleList(messages:state.message??[],isTyping: state.isUserTyping??false,

                          chatTextFiled:       /// Input bar
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: AppColors.colE2F1FA,
                            // Light blue background
                            borderRadius: BorderRadius.circular(
                                40.sp), // Fully rounded edges
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _chatController,
                                  style: regularTextStyle(
                                    fontSize: dimen14.sp,
                                    color: AppColors.col232323, // Text color
                                  ),
                                  onChanged: (value){
                                    context.read<ChatDetailBloc>()
                                        .add(
                                      UserTypingEventAPI(roomID: "client12_casemanager",clientId:"casemanager")
                                    );
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Tell us what happened . . .",
                                    hintStyle: lightTextStyle(
                                      fontSize: dimen14.sp,
                                      color: AppColors.colBlack, //
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap:(){
                                  context
                                      .read<ChatDetailBloc>()
                                      .add(
                                      SendMessageEvent(
                                          sendBy: "casemanager",
                                          senderId: "casemanager",
                                          receiverId: "client12",
                                          message: _chatController.text,
                                        roomId: "client12_casemanager"
                                      ));
                                  _chatController.clear();
                                },
                                child: Icon(
                                  Icons.send,
                                  color: AppColors.colBlack,
                                ),
                              )
                            ],
                          ),
                        ),
                        ),



                        SizedBox(height: 10.h),

                        /// Report Button
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context);
                          },
                          child: Center(
                              child: Text("Report This Client",
                                  style: TextStyle(
                                      fontSize: dimen12.sp,
                                      color:
                                          AppColors.colBlack.withOpacity(0.5),
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "InterRegular"))),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double constraintsHeight = constraints.maxHeight;
              final double constraintsWidth = constraints.maxWidth;
              return Container(
                height: constraintsHeight * 0.7,
                width: constraintsWidth * 0.98,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: AppColors.colD9D9.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Report User",
                            style: semiBoldTextStyle(
                                fontSize: dimen18.sp,
                                color: AppColors.colaCADBC)),
                        SvgPicture.asset(Assets.svg.report),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 40.h),
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.colDF2.withOpacity(0.2)),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(25.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.colDF2),
                          child: Center(
                            child: SvgPicture.asset(Assets.svg.flag2),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: Text(
                        "Are you sure you want to report user?",
                        style: semiBoldTextStyle(
                            fontSize: dimen18.sp, color: AppColors.colBlack),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        "By doing this Client: John Mills account will be blocked. This action can not be undone!",
                        textAlign: TextAlign.center,
                        style: regularTextStyle(
                            fontSize: dimen11.sp, color: AppColors.colBlack),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.colE1E1E1,
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: lightTextStyle(
                                    fontSize: dimen14.sp,
                                    color: AppColors.col6666),
                              ),
                            ),
                          ),
                        )),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.colDF2,
                            ),
                            child: Center(
                              child: Text(
                                "Report",
                                style: lightTextStyle(
                                    fontSize: dimen14.sp,
                                    color: AppColors.colWhite),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
