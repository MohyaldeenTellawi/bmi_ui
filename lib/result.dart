import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);
  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText = " ";
    if (result >= 30)
      resultText = "Obese";
    else if (result > 25 && result < 30)
      resultText = "Overweight";
    else if (result >= 18.5 && result <= 24.9)
      resultText = "Normal";
    else
      resultText = "Underweight";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Result",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(145, 56, 49, 1),
        foregroundColor: const Color.fromRGBO(245, 222, 179, 1),
      ),
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: 350,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Gender: ${isMale ? "Male" : "Female"}",
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Result: ${result.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Age: $age",
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Healthiness: $resultPhrase",
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
