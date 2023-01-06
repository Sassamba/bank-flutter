import 'package:bank/screens/dasboard.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(BankApp());
}

class BankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.green[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.greenAccent[700],
            textTheme: ButtonTextTheme.accent,
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.green
          )
        ),
        home: Dashboard()//Dashboard(),
    );
  }

}

