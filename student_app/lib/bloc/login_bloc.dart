import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/bloc/login_event.dart';
import 'package:student_app/bloc/login_state.dart';
import 'package:student_app/model/etudiant.dart';
import 'package:student_app/repository/student_repository.dart';
import 'package:student_app/repository/course_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  StudentRepository studentrepository = StudentRepository();

  LoginBloc() : super(LoginState()) {
    on<LoginAuthEvent>(_mapLoginButtonPressedToState);
  }


  Future<void> _mapLoginButtonPressedToState(

  LoginAuthEvent event, Emitter<LoginState> emit) async {


    emit(OnLoginLoaded());

    try {
      final success =
          await studentrepository.logIn(event.login, event.password);
      if (success != null) {
        saveStudent(success.user as Etudiant);
        saveToken(success.token as String);

        int? idUser  = await studentrepository.getUserId();
        emit(LoginSuccess(success: true));
      } else {
        emit(LoginFailure(
            success: false,
            message: "Nom d'utilisateur ou mot de passe incorrect"));
      }
    } catch (message) {
      emit(LoginFailure(
          message: "Nom d'utilisateur ou mot de passe incorrect",
          success: false));
      print(message);
    }
  }

  void saveStudent(Etudiant etudiant ) async
  {
    SharedPreferences prefs =   await SharedPreferences.getInstance();
    String studentEncode = json.encode(etudiant);
    prefs.setString('user', studentEncode);
  }

  void saveToken(String token) async
  {
    SharedPreferences prefs =   await SharedPreferences.getInstance();
    String tokenEncode = json.encode(token);
    prefs.setString('token', tokenEncode);
  }

  getStudent() async
  {
    SharedPreferences prefs =   await SharedPreferences.getInstance();

    String? key = prefs.getString('user');
    var user = json.decode(key!);
    return user;
  }

  getToken() async
  {
    SharedPreferences prefs =   await SharedPreferences.getInstance();
    String? key = prefs.getString('token');
    var token = json.decode(key!);
    return token;
  }
}
