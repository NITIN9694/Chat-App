

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:endeavors/feature/dash_board/presentation/pages/dash_board_page.dart';
import 'package:endeavors/feature/main_page/bloc/nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  final List<Widget> _screens  = [
    DashBoardPage(),
    Container(),
    Container(),
    Container(),
  ];
  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.work_outline,
    Icons.chat_bubble_outline,
    Icons.calendar_today_outlined,
  ];

  final List<String> _labels = [
    'Clients',
    'Jobs',
    'Chat',
    'Calendar',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavCubit(),
      child: BlocBuilder<NavCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            body: _screens[selectedIndex],
            bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: selectedIndex,
            onTap: (index) => context.read<NavCubit>().updateIndex(index),
            icons: [Icons.home, Icons.work, Icons.chat, Icons.calendar_today],
            labels: ['Clients', 'Jobs', 'Chat', 'Calendar'],
          ),
          );
        },
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final List<IconData> icons;
  final List<String> labels;

  const _CustomBottomNavBar({
    required this.selectedIndex,
    required this.onTap,
    required this.icons,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isSelected)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Color(0xff375DFB),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  Icon(
                    icons[index],
                    color: isSelected ? Color(0xff375DFB) : Colors.grey,
                    size: isSelected ? 28 : 24,
                  ),
                  SizedBox(height: 4),
                  Text(
                    labels[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Color(0xff375DFB) : Colors.grey,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}


class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final List<IconData> icons;
  final List<String> labels;

  const CustomBottomNavBar({
    required this.selectedIndex,
    required this.onTap,
    required this.icons,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomNavClipper(
        selectedIndex: selectedIndex,
        itemCount: icons.length,
      ),
      child: Container(
        height: 80,
        color: Colors.white,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(icons.length, (index) {
                final isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () => onTap(index),
                  child: SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icons[index],
                          color: isSelected ? Color(0xff375DFB) : Colors.grey,
                          size: isSelected ? 28 : 24,
                        ),
                        SizedBox(height: 4),
                        Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected ? Color(0xff375DFB) : Colors.grey,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            height: 3,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color(0xff375DFB),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            Positioned(
              top: -10,
              left: (selectedIndex + 0.5) * MediaQuery.of(context).size.width / icons.length - 5,
              child: CustomPaint(
                size: Size(10, 10),
                painter: DotPainter(Offset(5, 5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class DotPainter extends CustomPainter {
  final Offset offset;

  DotPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Color(0xff375DFB);
    canvas.drawCircle(offset, 5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class BottomNavClipper extends CustomClipper<Path> {
  final int selectedIndex;
  final int itemCount;

  BottomNavClipper({required this.selectedIndex, required this.itemCount});

  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    final double curveWidth = 70;
    final double curveHeight = 30;

    final double itemWidth = width / itemCount;
    final double startX = selectedIndex * itemWidth + (itemWidth - curveWidth) / 2;

    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(startX, 0);

    // Curve Up
    path.quadraticBezierTo(
      startX + curveWidth * 0.25, -curveHeight,
      startX + curveWidth * 0.5, -curveHeight,
    );
    path.quadraticBezierTo(
      startX + curveWidth * 0.75, -curveHeight,
      startX + curveWidth, 0,
    );

    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant BottomNavClipper oldClipper) =>
      oldClipper.selectedIndex != selectedIndex;
}
