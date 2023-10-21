import 'package:flutter/material.dart';

void main() {
  runApp(MyCustomButttonRealTime());
}

class MyCustomButttonRealTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LaunchScreent();
  }
}

class LaunchScreent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyScreen();
  }
}

class MyScreen extends State<LaunchScreent> {
  bool stateTextClick = true;

  Widget FirstWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Text("First String")],
    );
  }

  Widget SecondWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Second String",
        ),
        Padding(
          padding: EdgeInsets.only(right: 15),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (stateTextClick) FirstWidget() else SecondWidget(),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      stateTextClick = !stateTextClick;
                    });
                  },
                  child: Text("Click me"))
            ],
          ),
        ),
      ),
    );
  }
}
