import 'dart:ffi';

class Etudiant {
  String ? fullname;
  String ? login;
  String ? password;
  String ? email;
  int ? id;

  Etudiant(
  {
    this.fullname,
    this.id,
    this.email,
    this.login,
    this.password,

});

  Etudiant.fromJson(dynamic json){
    fullname = json['fullname'];
    login = json['login'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'login': login,
      'id': id,
      'email': email,
      'password': password,
    };
  }


}