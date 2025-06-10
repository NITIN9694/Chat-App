import 'package:endeavors/feature/auth/presentation/pages/login_page.dart';
import 'package:endeavors/feature/dash_board/presentation/pages/dash_board_page.dart';
import 'package:endeavors/feature/main_page/presentation/main_page.dart';
import 'package:endeavors/feature/splash/pages/splash_page.dart';
import 'package:endeavors/routes/animated_slidedirection.dart';
import 'package:endeavors/routes/app_pages.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.dashBoard
          :
        return SlidePageRoute(
            page: const DashBoardPage(), direction: SlideDirection.bottomToTop);
      case AppRoutes.main
          :
        return MaterialPageRoute(builder: (_) =>  MainPage());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ),
        );
    }
  }


}