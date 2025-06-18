import 'package:endeavors/infrastructure/utils/base_layout.dart';
import 'package:endeavors/screens/auth/bloc/login_bloc.dart';
import 'package:endeavors/screens/dash_board/client/bloc/client_bloc.dart';
import 'package:endeavors/screens/main_page/bloc/nav_cubit.dart';
import 'package:endeavors/screens/profile/bloc/profile_bloc.dart';
import 'package:endeavors/screens/profile/data/repo/profile_employement_conditions_repo.dart';
import 'package:endeavors/screens/splash/bloc/splash_bloc.dart';
import 'package:endeavors/initializer.dart';
import 'package:endeavors/infrastructure/routes/app_pages.dart';
import 'package:endeavors/infrastructure/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  await Initializer.init();


  runApp(
      MyApp());
  //     DevicePreview(
  //
  //       builder: (context)=>const MyApp() ,
  //     )
  // );
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
              BlocProvider<ClientBloc>(create: (_) => ClientBloc()),
              BlocProvider<ProfileBloc>(create: (_) => ProfileBloc(ProfileEmploymentConditionRepo()))

            ],
            child:BaseSafeAreaLayout(
              child:MaterialApp(
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,

                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                initialRoute: AppRoutes.main,
                onGenerateRoute: AppPages.onGenerateRoute,
              ))
            ) ;
      },
    );
  }
}
