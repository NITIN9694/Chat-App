import 'package:endeavors/feature/auth/presentation/bloc/login_bloc.dart';
import 'package:endeavors/feature/dash_board/presentation/bloc/dash_board_bloc.dart';
import 'package:endeavors/feature/main_page/bloc/nav_cubit.dart';
import 'package:endeavors/feature/splash/bloc/splash_bloc.dart';
import 'package:endeavors/initializer.dart';
import 'package:endeavors/routes/app_pages.dart';
import 'package:endeavors/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await Initializer.init();
  runApp(const MyApp());
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
            providers: [BlocProvider<SplashBloc>(create: (_) => SplashBloc()),
              BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
              BlocProvider<NavCubit>(create: (_) => NavCubit()),

              BlocProvider<DashBoardBloc>(create: (_) => DashBoardBloc())

            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              initialRoute: AppRoutes.splash,
              onGenerateRoute: AppPages.onGenerateRoute,
            ));
      },
    );
  }
}
