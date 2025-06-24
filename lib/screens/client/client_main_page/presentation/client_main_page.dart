import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/screens/case_manager/dash_board/case_manager/presentation/pages/case_manager_page.dart';
import 'package:endeavors/screens/case_manager/main_page/presentation/widget/custom_bottom_nav_bar.dart';
import 'package:endeavors/screens/client/client_dashboard/client_home/presentation/pages/client_home_page.dart';
import 'package:endeavors/screens/client/client_dashboard/client_learn/presentation/pages/client_course_learn_page.dart';
import 'package:endeavors/screens/client/client_main_page/bloc/client_main_nav.dart';
import 'package:endeavors/screens/side_menu/side_menu.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
class ClientMainPage extends StatefulWidget {
  final int initialIndex;
  const ClientMainPage({super.key, this.initialIndex = 0});

  @override
  State<ClientMainPage> createState() => _ClientMainPageState();
}

class _ClientMainPageState extends State<ClientMainPage>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _selectedIndex = 0;
  double _currentPosition = 0;

  final List<Widget> _screens = [
    ClientHomePage(),
    ClientCourseLearnPage(),
    Container(),
    Container(),
    Container(),
  ];

  final List<String> _icons = [
    Assets.svg.bottomHome,
    Assets.svg.bookOpen,
    Assets.svg.bottomJob,
    Assets.svg.bottomChat,
    Assets.svg.person,
  ];

  final List<String> _labels = [
    'Clients',
    'Learn',
    'Jobs',
    'Support',
    'Profile',
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
      context.read<ClientMainNav>().updateIndex(widget.initialIndex);
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
    context.read<ClientMainNav>().updateIndex(index);

    setState(() {
      _selectedIndex = index;
      _currentPosition = newPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: ZoomDrawer(
          menuBackgroundColor: AppColors.colB6D,
          menuScreen: SideMenu(onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
              onTapSelectBottomBar(index);

            });
          }),
          mainScreen: BlocBuilder<ClientMainNav, int>(
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
          mainScreenTapClose: true),
    );
  }
}