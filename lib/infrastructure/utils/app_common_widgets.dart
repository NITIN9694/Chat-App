
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCommonWidgets{
  List<BoxShadow> commonBoxShadow(){
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: Offset(0, 4),

      ),
    ];
  }
  
  Widget commonAppBar(context,String title){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_rounded,color: AppColors.colWhite,)),
        Spacer(),
      Text(title,style: regularTextStyle(fontSize: dimen15.sp, color: AppColors.colWhite),),
        Spacer(),
      ],
    );
  }
}