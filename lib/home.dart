import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;

  int weightVal = 55;
  int age = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Body Mass Index",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: const Color.fromRGBO(145, 56, 49, 1),
        foregroundColor: const Color.fromRGBO(245, 222, 179, 1),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Row(children: [
                m1Expanded(context, "male"),
                const SizedBox(width: 15),
                m1Expanded(context, "female"),
              ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.black12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(154, 42, 42, 1),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          heightVal.toStringAsFixed(2),
                          style: const TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w800,
                              color: Colors.blueGrey),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "CM",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(154, 42, 42, 1),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        min: 90,
                        max: 220,
                        activeColor: Color.fromRGBO(154, 42, 42, 1),
                        inactiveColor: Color.fromRGBO(96, 130, 182, 1),
                        value: heightVal,
                        onChanged: (newValue) {
                          setState(() {
                            heightVal = newValue;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Row(children: [
                m2Expanded(context, "weight"),
                const SizedBox(width: 15),
                m2Expanded(context, "age"),
              ]),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(95, 0, 95, 0),
            height: MediaQuery.of(context).size.height / 20,
            width: double.infinity,
            child: ElevatedButton(
              style: const ButtonStyle(
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                foregroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(245, 222, 179, 1),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(145, 56, 49, 1),
                ),
              ),
              onPressed: () {
                var result = weightVal / pow(heightVal / 100, 2);
                print(result);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Result(
                      result: result,
                      isMale: isMale,
                      age: age,
                    );
                  }),
                );
              },
              child: const Text(
                "Calculate",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == "male" ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              color: (isMale && type == "male") || (!isMale && type == "female")
                  ? Color.fromRGBO(225, 193, 110, 1)
                  : Colors.black12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 85,
              ),
              const SizedBox(height: 5),
              Text(type == "male" ? "Male" : "Female",
                  style: const TextStyle(
                    color: Color.fromRGBO(154, 42, 42, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color: Colors.black12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == "weight" ? "Weight" : "Age",
              style: const TextStyle(
                  color: Color.fromRGBO(154, 42, 42, 1),
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 5),
            Text(
              type == "weight" ? "$weightVal" : "$age",
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 45,
                  fontWeight: FontWeight.w800),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Color.fromRGBO(154, 42, 42, 1),
                  heroTag: type == "age" ? "age--" : "weight--",
                  onPressed: () {
                    setState(() {
                      type == "age" ? age++ : weightVal++;
                    });
                  },
                  child: Icon(Icons.add),
                  mini: true,
                ),
                const SizedBox(width: 12),
                FloatingActionButton(
                  backgroundColor: Color.fromRGBO(154, 42, 42, 1),
                  heroTag: type == "age" ? "age++" : "weight++",
                  onPressed: () {
                    setState(() {
                      type == "age" ? age-- : weightVal--;
                    });
                  },
                  child: Icon(Icons.remove),
                  mini: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
