import 'package:flutter/material.dart';
import 'package:flutter_rxdart/screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rxdart",
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/',
      home: HomeScreen(),
    );
  }
}
