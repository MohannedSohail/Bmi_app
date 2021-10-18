import 'dart:math';

import 'package:bmi_app/resultscreen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 160;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI App"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      buildExpanded(context, 'male'),
                      SizedBox(
                        width: 20,
                      ),
                      buildExpanded(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              heightVal.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Text(
                              "CM",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Slider(
                            value: heightVal,
                            min: 90,
                            max: 220,
                            onChanged: (newvalue) {
                              setState(() {
                                heightVal = newvalue;
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      buildExpanded2(context, 'age'),
                      SizedBox(
                        width: 20,
                      ),
                      buildExpanded2(context, 'weight'),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.teal),
                // color: Colors.teal,
                child: TextButton(
                  onPressed: () {
                    var result = weight / pow(heightVal / 100, 2);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultScreen(
                              result: result, isMale: isMale, age: age);
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExpanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? "Male" : "Female",
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && type == 'male') || (!isMale && type == 'female')
                  ? Colors.teal
                  : Colors.blueGrey),
        ),
      ),
    );
  }

  Expanded buildExpanded2(BuildContext context, String type) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? "Age" : "Weight",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              type == 'age' ? "$age" : "$weight",
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? "age++" : "weight++",
                  mini: true,
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? "age--" : "weight--",
                  mini: true,
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  child: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
      ),
    );
  }
}
