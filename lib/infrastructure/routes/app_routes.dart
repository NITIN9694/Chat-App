import 'package:chat/screens/auth/presentation/pages/login_page.dart';
import 'package:chat/screens/case_manager/case_manager_detail/presentation/pages/case_manager_detail_page.dart';
import 'package:chat/screens/chat_detail/presentation/pages/chat_detail_page.dart';
import 'package:chat/screens/case_manager/dash_board/calendar/presentation/pages/calender_page.dart';
import 'package:chat/screens/case_manager/dash_board/case_manager/presentation/pages/case_manager_page.dart';
import 'package:chat/screens/case_manager/dash_board/jobs/presentation/pages/job_page.dart';
import 'package:chat/screens/case_manager/job_details/presentation/pages/job_detail_page.dart';
import 'package:chat/screens/case_manager/main_page/presentation/main_page.dart';
import 'package:chat/screens/case_manager/profile/presentation/pages/profile_page.dart';
import 'package:chat/screens/client/client_calendar/presentation/pages/client_calendar_page.dart';
import 'package:chat/screens/client/client_chat/presentation/page/client_chat_detail_page.dart';
import 'package:chat/screens/client/client_dashboard/client_home/presentation/pages/client_home_page.dart';
import 'package:chat/screens/client/client_dashboard/client_learn/presentation/pages/client_course_learn_page.dart';
import 'package:chat/screens/client/client_dashboard/client_support/presentation/pages/client_support_page.dart';
import 'package:chat/screens/client/client_main_page/presentation/client_main_page.dart';
import 'package:chat/screens/splash/pages/splash_page.dart';
import 'package:chat/infrastructure/routes/animated_slidedirection.dart';
import 'package:chat/infrastructure/routes/app_pages.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case AppRoutes.chatDetailPage:
        return SlidePageRoute(page: const ChatDetailPage(), direction: SlideDirection.rightToLeft);
      // MaterialPageRoute(builder: (_) =>  ChatDetailPage());

     default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
