import 'dart:developer';

import 'package:chat/screens/chat_detail/bloc/case_manager_chat_detail_bloc.dart';
import 'package:chat/screens/chat_detail/data/model/get_chat_model.dart';
import 'package:chat/screens/chat_detail/data/model/check_user_model.dart';
import 'package:chat/screens/chat_detail/data/model/send_message_model.dart';
import 'package:chat/styles/colors.dart';
import 'package:chat/styles/sizes.dart';
import 'package:chat/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ChatBubbleList extends StatefulWidget {
  final List<MessagesModel> messages;
  final bool isTyping;
  final Widget chatTextFiled;

  const ChatBubbleList({
    super.key,
    required this.messages,
    required this.isTyping,
    required this.chatTextFiled,
  });

  @override
  State<ChatBubbleList> createState() => _ChatBubbleListState();
}

class _ChatBubbleListState extends State<ChatBubbleList> {
  final ScrollController scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant ChatBubbleList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages.length != oldWidget.messages.length ||
        widget.isTyping != oldWidget.isTyping) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ///  Chat Messages
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: widget.messages.length + (widget.isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (widget.isTyping && index == widget.messages.length) {
                  return Align(
                      alignment: Alignment.centerLeft,
                      child: Lottie.asset(
                        "assets/image/loading_typing.json",
                        height: 50,
                      ),

                  );
                }

                final message = widget.messages[index].msg;
                final isSentByMe = widget.messages[index].sendBy == "casemanager";

                return Align(
                  alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:isSentByMe?CrossAxisAlignment.end: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: isSentByMe ? Colors.blue : Color(0xFFD8D8D8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(message ?? "", style:regularTextStyle(fontSize: dimen15, color: AppColors.colWhite)),
                      ),
                      widget.messages[index].dateTime!=null?  Text(getTime( widget.messages[index].dateTime.toString()),
                      style: regularTextStyle(fontSize: dimen11, color: AppColors.colBlack),
                      ):SizedBox()
                    ],
                  ),
                );
              },
            ),
          ),

          /// Chat Input (Always visible at bottom)
          widget.chatTextFiled
        ],
      ),
    );
  }

  String getTime(String time) {

    DateTime utcTime = DateTime.parse(time);
    DateTime localTime = utcTime.toLocal();
    String formatted = DateFormat("d MMMM y, h:mm a").format(localTime);
    return formatted;
  }
}


