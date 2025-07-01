part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginButtonPressed extends LoginEvent{
  String emailId;
  String password;
  LoginButtonPressed(this.emailId,this.password);
}