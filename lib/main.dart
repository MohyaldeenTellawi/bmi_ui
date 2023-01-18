import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(245, 222, 179, 1),
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w800,
            color: Color.fromRGBO(158, 160, 95, 1),
          ),
          headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color.fromRGBO(145, 56, 49, 1),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
