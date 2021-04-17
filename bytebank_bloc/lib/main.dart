import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/containers/dashboard.dart';
import 'components/theme.dart';

void main() {
  runApp(BytebankApp());
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change)  {
    print("${bloc.state.runtimeType} > $change");
    super.onChange(bloc, change);
  }
}

class BytebankApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    // na prática evitar log do genero, pois pode vazar informações sensíveis para o log
    Bloc.observer = LogObserver();

    return MaterialApp(
      theme: bytebanktheme,
      home: DashboardContainer(),
    );
  }
}
