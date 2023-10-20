import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/model/cours.dart';
import 'package:http/http.dart' as http;
import 'package:student_app/service/api_service.dart';

import '../model/user_login.dart';

class StudentRepository{
  String url = "courseByIdStudent";
  Future<List<Cours>> fetchCours(String id) async {
    final response = await http.get(Uri.parse("$url+$id"));
    if(response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Cours> courses = body.map((e) => Cours.fromJson(e)).toList();
      return courses;
    }
    else {
      throw Exception('Failed to load courses');
    }
  }


  Future <UserLogin> logIn(String login, String password) async
  {
    final response = await http.post(ApiService.buildUrl('login'),headers: {
    },body: {'login': login, 'password': password});
    if(response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final userLogin = UserLogin.fromJson(jsonResponse);
      return userLogin;
    }
    else {
      throw Exception('Failed to log in. ${response.reasonPhrase}');
    }

  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user');
    if (userData != null) {
      Map<String, dynamic> userMap = json.decode(userData);
      int? userID = userMap['id'];
      return userID;
    }
    return null;

  }

}
