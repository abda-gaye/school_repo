import 'package:student_app/model/etudiant.dart';

class UserLogin{
  Etudiant ? user;
  String ? token;

  UserLogin({
    this.user,
    this.token
});

  UserLogin.fromJson(dynamic json)
  {
    user = Etudiant.fromJson(json['user']);
    token = json['token'];
  }
}