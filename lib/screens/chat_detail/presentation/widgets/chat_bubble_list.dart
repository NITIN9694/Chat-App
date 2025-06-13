import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubbleList extends StatelessWidget {
  const ChatBubbleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          // Sent message
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                      topLeft: Radius.circular(15.r),
                    ),
                  ),
                  child: Text("Hello", style: TextStyle(color: Colors.white)),
                ),
                Text("11:08",
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
              ],
            ),
          ),

          // Received message
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                    ),
                  ),
                  child: Text("Hi there! How can I help?",
                      style: TextStyle(color: Colors.black)),
                ),
                Text("11:11",
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
