
import 'dart:async';


import 'package:endeavors/infrastructure/app_constant/app_constant.dart';
import 'package:endeavors/infrastructure/local_storage/pref_manager.dart';
import 'package:endeavors/screens/splash/bloc/splash_event.dart';
import 'package:endeavors/screens/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent,SplashSate>{
  late var isLoggedIn = false;
  SplashBloc():super(SplashInitial()){
    on<CheckAuthentication>(_onCheckAuthentication);
  }

  Future<void> _onCheckAuthentication(CheckAuthentication event,Emitter<SplashSate>emit)async{
    await Future.delayed(const Duration(seconds: 1));
    isLoggedIn = HiveManager.getBool(AppConstants.loggedIn);
    if(isLoggedIn){
      emit(SplashNavigateToHome());
    }else{
      emit(SplashNavigationToLogin());
    }
  }
}