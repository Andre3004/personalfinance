import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackacom/screens/home_screen.dart';

void main() {
  runApp(HackacomApp());
}

class HackacomApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.lightBlue, accentColor: Colors.green),
      home: HomeScreen(),
    );
  }
}