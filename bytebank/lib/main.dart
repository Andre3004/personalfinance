import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.purple[900],
          accentColor: Colors.purpleAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.purpleAccent[700],
            textTheme: ButtonTextTheme.primary,
          )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Dashboard(),
      ),
    );
  }
}

