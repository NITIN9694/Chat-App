
import 'package:endeavors/screens/case_manager/main_page/presentation/widget/bottom_nav_cliper.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final List<String> icons;
  final double animatedPosition;

  final List<String> labels;

  const CustomBottomNavBar({
    required this.selectedIndex,
    required this.onTap,
    required this.icons,
    required this.labels,
    required this.animatedPosition
  });

  @override
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double itemWidth = width / icons.length;
    final double dotLeft = (animatedPosition + 0.5) * itemWidth - 5;

    return SizedBox(
      height: 72.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: BottomNavClipper(

                animatedPosition: animatedPosition,
                itemCount: icons.length,
                curveHeight: 18.h
            ),
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(
                color: AppColors.colWhite,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.sp),topRight: Radius.circular(10.sp)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(icons.length, (index) {
                    final isSelected = index == selectedIndex;

                    return GestureDetector(
                      onTap: () => onTap(index),
                      child: SizedBox(
                        width: 50.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              icons[index],
                              colorFilter: ColorFilter.mode(isSelected?AppColors.col007FC4:AppColors.col6666, BlendMode.srcIn),
                              fit: BoxFit.cover,
                              height:isSelected?17.h:16.h ,
                            ),
                            SizedBox(height: 4),
                            Text(
                              labels[index],
                              style: regularTextStyle(
                                fontSize:isSelected?11.sp:9.sp ,
                                color: isSelected?AppColors.col007FC4:AppColors.col6666,
                              ),
                            ),
                            if (isSelected)
                              Container(
                                margin: EdgeInsets.only(top: 2.h),
                                height: 3.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    color:AppColors.col007FC4,

                                    borderRadius: BorderRadius.circular(2),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 12,
                                        color:AppColors.col007FC4,
                                      )
                                    ]
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          // Dot on top of curve
          Positioned(
            top: 0,
            left: dotLeft,
            child: CustomPaint(
              size: Size(8.w, 8.h),
              painter: DotPainter(Offset(4, 9)),
            ),
          ),
        ],
      ),
    );
  }

}


class DotPainter extends CustomPainter {
  final Offset offset;

  DotPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.col007FC4;
    canvas.drawCircle(offset, 3.sp, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}