import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLogin);
    on<LoginEvent>((event, emit) {


    });
  }

  Future<void>_onLogin(LoginButtonPressed event,Emitter emit)async{
    emit(LoginLoading());
    var email = event.emailId;
    var pass = event.password;
    if(email=="nitin@softserv.in"){
      await Future.delayed(Duration(seconds: 3));
      emit(CaseManagerLoginSuccess());
    }else{
      await Future.delayed(Duration(seconds: 3));
      emit(ClientLoginSuccess());

    }

  }
}
