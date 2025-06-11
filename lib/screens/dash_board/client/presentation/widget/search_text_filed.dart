
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextFiled extends StatefulWidget {
  final String hintText;

  final TextEditingController controller;


  const SearchTextFiled({
    Key? key,
    required this.hintText,
    required this.controller,

  }) : super(key: key);

  @override
  State<SearchTextFiled> createState() => _SearchTextFiledState();
}

class _SearchTextFiledState extends State<SearchTextFiled> {



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.colE2F1FA, // Light blue background
        borderRadius: BorderRadius.circular(40.sp), // Fully rounded edges
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              style: regularTextStyle(
                fontSize: dimen14.sp,
                color: AppColors.col007FC4, // Text color
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: lightTextStyle(
                  fontSize: dimen14.sp,
                  color: AppColors.col007FC4, //
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SvgPicture.asset(Assets.svg.search,height: 17.h,width: 17.w,)
        ],
      ),
    )
    ;
  }
}
