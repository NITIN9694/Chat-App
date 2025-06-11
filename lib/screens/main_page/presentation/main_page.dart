import 'package:endeavors/screens/dash_board/calendar/presentation/pages/calender_page.dart';
import 'package:endeavors/screens/dash_board/chats/presentation/pages/chat_page.dart';
import 'package:endeavors/screens/dash_board/client/presentation/pages/cleint_page.dart';
import 'package:endeavors/screens/dash_board/jobs/presentation/pages/job_page.dart';
import 'package:endeavors/screens/main_page/bloc/nav_cubit.dart';
import 'package:endeavors/screens/main_page/presentation/widget/custom_bottom_nav_bar.dart';
import 'package:endeavors/gen/assets.gen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
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
    _animation = Tween<double>(begin: 0, end: 0).animate(_controller);
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
    setState(() {
      _selectedIndex = index;
      _currentPosition = newPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavCubit(),
      child: BlocBuilder<NavCubit, int>(
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
                              context.read<NavCubit>().updateIndex(index);
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
    );
  }
}
