import 'package:flutter/material.dart';
import 'package:personalfinance/screens/transferencia/lista.dart';

void main() => runApp(PersonalFinanceApp());

class PersonalFinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      home: ListaTransferencia(),
    );
  }
}
