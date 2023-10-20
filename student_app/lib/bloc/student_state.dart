import 'package:student_app/model/cours.dart';

class StudentState {

}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  List<Cours>courses = [];
  StudentLoaded({required this.courses});
}


class StudentError extends StudentState {
  String message = "";
  StudentError({required this.message});
}

