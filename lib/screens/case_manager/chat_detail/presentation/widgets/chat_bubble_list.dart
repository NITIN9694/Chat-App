import 'package:endeavors/screens/case_manager/chat_detail/data/model/check_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChatBubbleList extends StatefulWidget {
  final List<UserChatModelMessages> messages;

  const ChatBubbleList({super.key,required this.messages});

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
        reverse: true,
        itemCount:widget.messages.length,
        itemBuilder: (context,index){
          isSentByMe = widget.messages[index].sendBy=="cm001"?true:false;
          final message = widget.messages[index].message??"";
          final alignment = isSentByMe ? Alignment.centerLeft : Alignment.centerRight;

          final crossAxisAlignment = isSentByMe ? Alignment.centerRight : Alignment.centerLeft;
          return   Align(
            alignment: alignment,
            child: Column(

              children: [

            Align(
            alignment:crossAxisAlignment,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: isSentByMe?Colors.blue:Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      bottomRight:isSentByMe ?Radius.zero:Radius.circular(15.r),
                      bottomLeft:Radius.circular(15.r),
                      topLeft: isSentByMe?Radius.circular(15.r):Radius.circular(0.r),

                    ),
                  ),
                  child: Text(message, style: TextStyle(color: Colors.white)),
                ),
                // Text(getTime(widget.messages[index].timestamp.toString()??""),
                //     style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
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


