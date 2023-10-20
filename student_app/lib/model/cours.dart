class Cours{
  String ? id;
  String ? annee;
  String ? classe;
  String ? fullname;
  String ? login;
  String ? password;

  Cours
  ({
    this.id,
    this.annee,
    this.classe,
    this.fullname,
    this.login,
    this.password,
});

  Cours.fromJson(dynamic json){
    annee = json['annee'];
    login = json['login'];
    classe = json['classe'];
    id = json['id'];
    password = json['password'];
    fullname= json['fullname'];
  }

}