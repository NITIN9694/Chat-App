

import 'package:endeavors/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';



class ClientLoadingShimmer {


  Widget clientLoadingShimmer(){
    return SingleChildScrollView(
      child:     Column(
        children: List.generate(

          (10 / 2).ceil(),
              (index) {
            final first = index * 2;
            final second = (index * 2 + 1 < 10 )
                ? index * 2 + 1
                : null;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: .0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),


                  SizedBox(width: 12.w),
                  if (second != null)
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width:100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )
                  else
                    Expanded(child: Container(

                    )),
                  // Empty to fill space
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}