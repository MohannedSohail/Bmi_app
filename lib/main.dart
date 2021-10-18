import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'resultscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
          textTheme: const TextTheme(
            headline2: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            headline1: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
                color: Colors.white
            ),
          ),

        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home:  MyHomePage(),
    );
  }
}
