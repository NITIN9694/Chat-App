import 'package:endeavors/screens/case_manager/chat_detail/data/model/check_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ChatBubbleList extends StatefulWidget {
  final List<UserChatModelMessages> messages;
  final bool isTyping;

  const ChatBubbleList({super.key,required this.messages,required this.isTyping});

  @override
  State<ChatBubbleList> createState() => _ChatBubbleListState();
}

class _ChatBubbleListState extends State<ChatBubbleList> {
  var isSentByMe = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        reverse: false,
        itemCount:widget.messages.length,
        itemBuilder: (context, index) {
          if (widget.isTyping && index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
              child: Align(
                alignment: Alignment.centerLeft, // Typing usually on left side
                child: Lottie.asset(
                  "assets/image/loading_typing.json",
                  height: 50.h,
                  fit: BoxFit.contain,
                ),
              ),
            );
          }

          final actualIndex = widget.isTyping ? index - 1 : index;
          final messageData = widget.messages[actualIndex];

          final isSentByMe = messageData.sendBy == "cm001";
          final message = messageData.message ?? "";
          final alignment = isSentByMe ? Alignment.centerRight : Alignment.centerLeft;
          final crossAxisAlignment =
          isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

          return Align(
            alignment: alignment,
            child: Column(
              children: [
                Align(
                  alignment: alignment,
                  child: Column(
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: isSentByMe ? Colors.blue : Color(0xFFD8D8D8),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            bottomRight: isSentByMe ? Radius.zero : Radius.circular(15.r),
                            bottomLeft: Radius.circular(15.r),
                            topLeft: isSentByMe ? Radius.circular(15.r) : Radius.circular(0.r),
                          ),
                        ),
                        child: Text(message, style: TextStyle(color: Colors.white)),
                      ),
                      Text(
                        getTime(messageData.timestamp.toString()),
                        style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },


      ),
    );
  }
  getTime(String time){

    // Parse the ISO string to DateTime in UTC
    DateTime utcTime = DateTime.parse(time);

    // Convert to local time
    DateTime localTime = utcTime.toLocal();

    // Format the DateTime
    String formatted = DateFormat("d MMMM y, h:mm a").format(localTime);
    return formatted;
  }

}


