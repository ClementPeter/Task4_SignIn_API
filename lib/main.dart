import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Group 11 log In page for Abbey Foods',
        theme: ThemeData(primarySwatch: Colors.orange),
        home: SignUp());
  }
}
