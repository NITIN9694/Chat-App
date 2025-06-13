import 'package:endeavors/screens/auth/presentation/pages/login_page.dart';
import 'package:endeavors/screens/chat_detail/presentation/pages/chat_detail_page.dart';
import 'package:endeavors/screens/client_detail/presentation/pages/client_detail_page.dart';
import 'package:endeavors/screens/dash_board/calendar/presentation/pages/calender_page.dart';
import 'package:endeavors/screens/dash_board/client/presentation/pages/cleint_page.dart';
import 'package:endeavors/screens/dash_board/jobs/presentation/pages/job_page.dart';
import 'package:endeavors/screens/job_details/presentation/pages/job_detail_page.dart';
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
      case AppRoutes.calendarPage
          :
        return MaterialPageRoute(builder: (_) =>  CalenderPage());
      case AppRoutes.clientPageDetail
          :
        return MaterialPageRoute(builder: (_) =>  ClientPageDetail());
      case AppRoutes.jobDetailPage
          :
        return MaterialPageRoute(builder: (_) =>  JobDetailPage());
      case AppRoutes.chatDetailPage
          :
        return MaterialPageRoute(builder: (_) =>  ChatDetailPage());
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