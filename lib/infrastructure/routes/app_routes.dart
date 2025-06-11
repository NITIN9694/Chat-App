import 'package:endeavors/screens/auth/presentation/pages/login_page.dart';
import 'package:endeavors/screens/dash_board/client/presentation/pages/cleint_page.dart';
import 'package:endeavors/screens/dash_board/jobs/presentation/pages/job_page.dart';
import 'package:endeavors/screens/main_page/presentation/main_page.dart';
import 'package:endeavors/screens/splash/pages/splash_page.dart';
import 'package:endeavors/infrastructure/routes/animated_slidedirection.dart';
import 'package:endeavors/infrastructure/routes/app_pages.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.client
          :
        return SlidePageRoute(
            page: const ClientPage(), direction: SlideDirection.bottomToTop);
      case AppRoutes.main
          :
        return MaterialPageRoute(builder: (_) =>  MainPage());
      case AppRoutes.job
          :
        return MaterialPageRoute(builder: (_) =>  JobPage());

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