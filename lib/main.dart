import 'package:chat/infrastructure/utils/base_layout.dart';
import 'package:chat/screens/auth/bloc/login_bloc.dart';
import 'package:chat/screens/chat_detail/bloc/case_manager_chat_detail_bloc.dart';
import 'package:chat/screens/chat_detail/data/repo/case_manager_chat_detail_repo.dart';
import 'package:chat/screens/chat_detail/data/repo/chat_pusher_service.dart';
import 'package:chat/screens/case_manager/dash_board/case_manager/bloc/case_manager_bloc.dart';
import 'package:chat/screens/case_manager/main_page/bloc/nav_cubit.dart';
import 'package:chat/screens/case_manager/profile/bloc/profile_bloc.dart';
import 'package:chat/screens/case_manager/profile/data/repo/profile_employement_conditions_repo.dart';
import 'package:chat/screens/client/client_chat/bloc/client_chat_bloc.dart';
import 'package:chat/screens/client/client_chat/data/repo/client_chat_repo.dart';
import 'package:chat/screens/client/client_chat/data/repo/client_pusher_repo.dart';
import 'package:chat/screens/client/client_dashboard/client_profile/bloc/client_profile_bloc.dart';
import 'package:chat/screens/client/client_dashboard/client_profile/data/repo/client_repo_profile.dart';
import 'package:chat/screens/client/client_dashboard/client_support/bloc/client_support_bloc.dart';
import 'package:chat/screens/splash/bloc/splash_bloc.dart';
import 'package:chat/initializer.dart';
import 'package:chat/infrastructure/routes/app_pages.dart';
import 'package:chat/infrastructure/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

import 'screens/client/client_main_page/bloc/client_main_nav.dart';

void main() async {
  await Initializer.init();


  runApp(
      MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider<ChatDetailBloc>(create: (_) => ChatDetailBloc(CaseManagerChatDetailRepository(),PusherService())),

            
            ],
            child:BaseSafeAreaLayout(
              child:MaterialApp(
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,

                title: 'Chat App',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                initialRoute: AppRoutes.chatDetailPage,
                onGenerateRoute: AppPages.onGenerateRoute,
              ))
            ) ;
      },
    );
  }
}
