import 'package:student_app/model/user_login.dart';

class LoginState{}

class OnLoginLoaded extends LoginState{}



class ErrorInAuthState extends LoginState{
  String message = "";
  ErrorInAuthState({required this.message});
}

class LoginSuccess extends LoginState {
  final bool success;

  LoginSuccess({required this.success});
}

class LoginLoading extends LoginState {}


class LoginFailure extends LoginState {
   bool success;
   String message;

  LoginFailure({required this.success, required this.message});
}

