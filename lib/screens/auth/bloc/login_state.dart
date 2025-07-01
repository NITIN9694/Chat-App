part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}
class LoginSuccess extends LoginState{}
class ClientLoginSuccess extends LoginState{}
class CaseManagerLoginSuccess extends LoginState{}


class LoginFailed  extends LoginState{}


