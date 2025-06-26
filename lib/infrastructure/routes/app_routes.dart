import 'package:endeavors/screens/auth/presentation/pages/login_page.dart';
import 'package:endeavors/screens/case_manager/case_manager_detail/presentation/pages/case_manager_detail_page.dart';
import 'package:endeavors/screens/case_manager/chat_detail/presentation/pages/chat_detail_page.dart';
import 'package:endeavors/screens/case_manager/dash_board/calendar/presentation/pages/calender_page.dart';
import 'package:endeavors/screens/case_manager/dash_board/case_manager/presentation/pages/case_manager_page.dart';
import 'package:endeavors/screens/case_manager/dash_board/jobs/presentation/pages/job_page.dart';
import 'package:endeavors/screens/case_manager/job_details/presentation/pages/job_detail_page.dart';
import 'package:endeavors/screens/case_manager/main_page/presentation/main_page.dart';
import 'package:endeavors/screens/case_manager/profile/presentation/pages/profile_page.dart';
import 'package:endeavors/screens/client/client_calendar/presentation/pages/client_calendar_page.dart';
import 'package:endeavors/screens/client/client_dashboard/client_home/presentation/pages/client_home_page.dart';
import 'package:endeavors/screens/client/client_dashboard/client_learn/presentation/pages/client_course_learn_page.dart';
import 'package:endeavors/screens/client/client_dashboard/client_support/presentation/pages/client_support_page.dart';
import 'package:endeavors/screens/client/client_main_page/presentation/client_main_page.dart';
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
      case AppRoutes.caseManagerPage:
        return SlidePageRoute(page: const CaseManagerPage(), direction: SlideDirection.bottomToTop);
      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => MainPage());
      case AppRoutes.job:
        return MaterialPageRoute(builder: (_) => JobPage());
      case AppRoutes.calendarPage:
        return MaterialPageRoute(builder: (_) => CalenderPage());
      case AppRoutes.caseManagerPageDetail:
        return SlidePageRoute(page: const CaseManagerPageDetail(), direction: SlideDirection.rightToLeft);
      // MaterialPageRoute(builder: (_) =>  CaseManagerPageDetail());
      case AppRoutes.jobDetailPage:
        return SlidePageRoute(page: const JobDetailPage(), direction: SlideDirection.rightToLeft);

      case AppRoutes.chatDetailPage:
        return SlidePageRoute(page: const ChatDetailPage(), direction: SlideDirection.rightToLeft);
      // MaterialPageRoute(builder: (_) =>  ChatDetailPage());
      case AppRoutes.profilePage:
        // return MaterialPageRoute(builder: (_) =>  ProfilePage());
        return SlidePageRoute(page: ProfilePage(), direction: SlideDirection.rightToLeft);

      //Client Page Route
      case AppRoutes.clientMainPage:
        return MaterialPageRoute(builder: (_) => ClientMainPage());
      case AppRoutes.clientHomePage:
        return SlidePageRoute(page: ClientHomePage(), direction: SlideDirection.rightToLeft);
      case AppRoutes.clientCalendarPage:
        return SlidePageRoute(page: ClientCalendarPage(), direction: SlideDirection.rightToLeft);
      case AppRoutes.clientCourseLearn:
        return SlidePageRoute(page: ClientCourseLearnPage(), direction: SlideDirection.rightToLeft);
      case AppRoutes.clientSupportPage:
        return SlidePageRoute(page: ClientSupportPage(), direction: SlideDirection.rightToLeft);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
