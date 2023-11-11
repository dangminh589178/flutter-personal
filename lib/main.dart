import 'package:flutter/material.dart';
import 'package:myapp_flutter/MyApp.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green
    ),
    title: 'Transaction app',
    home: MyApp(),
  ));
}
