import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tableau de bord'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // Naviguer vers la page des cours
                },
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500), // Durée de l'animation
                  opacity: 1.0, // Opacité initiale
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.book,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Cours',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Naviguer vers la page des absences
                },
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500), // Durée de l'animation
                  opacity: 1.0, // Opacité initiale
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.warning,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Absences',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
