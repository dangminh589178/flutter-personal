import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Myapp();
  }
}

class _Myapp extends State<MyApp> {

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Text("sad"),
      ),
    );
  }
}
