import 'dart:developer';

import 'package:endeavors/screens/dash_board/calendar/presentation/pages/calender_page.dart';
import 'package:endeavors/screens/dash_board/chats/presentation/pages/chat_page.dart';
import 'package:endeavors/screens/dash_board/client/presentation/pages/client_page.dart';
import 'package:endeavors/screens/dash_board/jobs/presentation/pages/job_page.dart';
import 'package:endeavors/screens/main_page/bloc/nav_cubit.dart';
import 'package:endeavors/screens/main_page/presentation/widget/custom_bottom_nav_bar.dart';
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/screens/side_menu/side_menu.dart';
import 'package:endeavors/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;

  const MainPage({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _selectedIndex = 0;
  double _currentPosition = 0;

  final List<Widget> _screens = [
    ClientPage(),
    JobPage(),
    ChatPage(),
    CalenderPage(),
  ];

  final List<String> _icons = [
    Assets.svg.bottomHome,
    Assets.svg.bottomJob,
    Assets.svg.bottomChat,
    Assets.svg.bottonCalendar,
  ];

  final List<String> _labels = [
    'Clients',
    'Jobs',
    'Chat',
    'Calendar',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    // Animate to initial index
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NavCubit>().updateIndex(widget.initialIndex);
    });
    _animation = Tween<double>(begin: 0, end: 0).animate(_controller);

    onTapSelectBottomBar(widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTapSelectBottomBar(index) {
    final double newPosition = index.toDouble();
    _animation = Tween<double>(begin: _currentPosition, end: newPosition)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward(from: 0);
    context.read<NavCubit>().updateIndex(index);

    setState(() {
      _selectedIndex = index;
      _currentPosition = newPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: AppColors.colB6D,
        menuScreen: SideMenu(onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
            onTapSelectBottomBar(index);

          });
        }),
        mainScreen: BlocBuilder<NavCubit, int>(
          builder: (context, selectedIndex) {
            return Scaffold(

              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  _screens[selectedIndex],
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return CustomBottomNavBar(
                              animatedPosition: _animation.value,
                              selectedIndex: selectedIndex,
                              onTap: (index) {
                                onTapSelectBottomBar(index);
                              },
                              icons: _icons,
                              labels: _labels,
                            );
                          }))
                ],
              ),
            );
          },
        ),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        style: DrawerStyle.style3,
        mainScreenTapClose: true);
  }
}
