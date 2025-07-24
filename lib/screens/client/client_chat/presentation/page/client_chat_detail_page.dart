import 'dart:developer';

import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/case_manager/chat_detail/bloc/case_manager_chat_detail_bloc.dart';
import 'package:endeavors/screens/case_manager/chat_detail/presentation/widgets/chat_bubble_list.dart';
import 'package:endeavors/screens/case_manager/chat_detail/presentation/widgets/chat_loading_shimmer.dart';
import 'package:endeavors/screens/client/client_chat/bloc/client_chat_bloc.dart';
import 'package:endeavors/screens/client/client_chat/presentation/widget/client_chat_bubble.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class ClientChatDetailPage extends StatefulWidget {
  const ClientChatDetailPage({super.key});

  @override
  State<ClientChatDetailPage> createState() => _ClientChatDetailPageState();
}

class _ClientChatDetailPageState extends State<ClientChatDetailPage> {
  TextEditingController _chatController = TextEditingController();
  late ClientChatBloc _chatBloc;


  @override
  void initState() {
    _chatBloc =  context.read<ClientChatBloc>()..add(ClientUserEvent(
        caseManagerName: "casemanage0",
        caseMangerId: "casemanage2",
        clientId: "cl001",
        clientName:"client0"
    ));
    log("this is called");
    // ..initializePusher("cl001_cm001"  );
    super.initState();


  }

  @override
  void dispose() {
    _chatBloc.disConnect();
    super.dispose();
  }


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
          BlocBuilder<ClientChatBloc, ClientChatState>(
              builder: (context, state) {
                log("State :- $state}");
                if(state is ClientSendMessageError){

                }
                if (state is CheckUserLoadingState) {
                  return ChatLoadingShimmer();
                } else if (state is CheckClientUserLoadedState) {
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
                                    .read<ClientChatBloc>()
                                    .add(
                                    ClientUserEvent(
                                        caseManagerName: "casemanage0",
                                        caseMangerId: "casemanage2",
                                        clientId: "client2",
                                        clientName:"client0"
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
                } else if (state is CheckClientUserLoadedState) {
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

                          SizedBox(height: 20.h),

                          /// Chat Bubbles
                          ClientChatBubble(messages:state.message??[],isTyping: state.isUserTyping??false,

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
                                      onChanged: (value){
                                        context.read<ClientChatBloc>()
                                            .add(
                                            ClientUserTypingEventAPI(roomID: "client12_casemanager",clientId:"client12")
                                        );
                                      },
                                      style: regularTextStyle(
                                        fontSize: dimen14.sp,
                                        color: AppColors.col232323, // Text color
                                      ),
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
                                          .read<ClientChatBloc>()
                                          .add(
                                          ClientSendMessageEvent(
                                              sendBy: "client12",
                                              senderId: "client12",
                                              receiverId: "casemanager",
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




                        ],
                      ),
                    ),
                  );
                }
                return Container();
              })

        ],
      ),
    );
  }
}
