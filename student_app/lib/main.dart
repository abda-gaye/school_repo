import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/bloc/login_bloc.dart';
import 'package:student_app/ui/login_page.dart';
import 'package:student_app/ui/mydrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(BuildContext context) => LoginBloc(),
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
          appBar: AppBar(
            title: Text('login page'),
            backgroundColor: Colors.cyan[800],
          ),
          body:LoginScreen()


      ),
    )
    );

  }
}


