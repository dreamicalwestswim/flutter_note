import 'package:flutter/material.dart';

import '../../widgets/text_field_underline.dart';

class TextFieldExample6 extends StatefulWidget {
  final String title;

  const TextFieldExample6({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldExample6> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFieldUnderline(
                  hintText: "输入用户名"
              ),
              TextFieldUnderline(
                  hintText: "输入密码",
                  obscureText: true,
              )
            ],
          )),
    );
  }
}
