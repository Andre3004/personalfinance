import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nuvigator/next.dart';
import 'package:shop_layout/controllers/cart_controller.dart';
import 'package:shop_layout/navigation/main_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<CartController>(
          create: (_) => CartController(),
        ),
        Provider<NumberFormat>(
          create: (_) => NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: Nuvigator(
        router: MainRouter(),
        screenType: materialScreenType,
        initialRoute: MainRoutes.home,
      ),
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 20, fontFamily: 'Alata', fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(
              fontSize: 20, fontFamily: 'Alata', fontWeight: FontWeight.bold, color: Colors.white),
          headline3: TextStyle(
              fontSize: 16, fontFamily: 'Alata', fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
