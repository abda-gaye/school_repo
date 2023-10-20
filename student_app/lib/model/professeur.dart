class Professeur {
  String ? fullname;
  String ? id;
  Professeur({
    this.fullname,
    this.id
});

  Professeur.fromJson(dynamic json)
  {
    fullname = json['fullname'];
    id = json['id'];
  }

}