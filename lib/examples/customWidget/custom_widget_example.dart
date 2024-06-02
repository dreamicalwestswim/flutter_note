import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/gradien_button.dart';


class CustomWidgetExample extends StatefulWidget {
  final String title;

  const CustomWidgetExample({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomWidgetExample> createState() => _CustomWidgetExampleState();
}

class _CustomWidgetExampleState extends State<CustomWidgetExample> {
  onTap() {
    print("button click");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: const [Colors.orange, Colors.red],
              height: 50.0,
              child: const Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightGreen, Colors.green.shade700],
              child: const Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(
              height: 50.0,
              //borderRadius: const BorderRadius.all(Radius.circular(5)),
              colors: [Colors.lightBlue.shade300, Colors.blueAccent],
              child: const Text("Submit"),
              onPressed: onTap,
            ),

            Button(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(colors: [Colors.blue, Colors.deepPurple]),
                // Gradient? gradient,
              ),
              loading: true,
              child: Text("加载中"),
            ),

            Button(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(colors: [Colors.blue, Colors.deepPurple]),
                // Gradient? gradient,
              ),
              disabled: true,
              child: Text("禁用"),
            ),
          ],
        ),
      ),
    );
  }
}
