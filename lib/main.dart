//@dart=2.9
import 'package:flutter/material.dart';

import 'modules/counter_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Counter',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: CounterScreen(),
    );
  }
}
