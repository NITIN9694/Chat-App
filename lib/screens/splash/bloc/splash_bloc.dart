
import 'dart:async';


import 'package:endeavors/screens/splash/bloc/splash_event.dart';
import 'package:endeavors/screens/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent,SplashSate>{
  SplashBloc():super(SplashInitial()){
    on<CheckAuthentication>(_onCheckAuthentication);
  }

  Future<void> _onCheckAuthentication(CheckAuthentication event,Emitter<SplashSate>emit)async{
    await Future.delayed(const Duration(seconds: 1));

    final isLoggedIn = false;
    if(isLoggedIn){
      emit(SplashNavigateToHome());
    }else{
      emit(SplashNavigationToLogin());
    }
  }
}