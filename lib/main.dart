import 'package:flutter/material.dart';
import 'home.dart';
import 'result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w800,
            color: Color.fromRGBO(158, 160, 95, 1),
          ),
          headline2: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
            color: Color.fromRGBO(96, 130, 182, 1),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
