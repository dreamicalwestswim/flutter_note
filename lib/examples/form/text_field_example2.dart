import 'package:flutter/material.dart';

class TextFieldExample2 extends StatefulWidget {
  final String title;

  const TextFieldExample2({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldExample2> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample2> {
  Map<String, dynamic> values = {
    'username': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          const Text('登录输入框'),
          TextField(
            autofocus: true,
            onChanged:(v){
              values['username'] = v;
            },
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            onChanged:(v){
              values['password'] = v;
            },
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)),
            obscureText: true,
            obscuringCharacter: "*",
          ),
          ElevatedButton(onPressed: () {
            print(values);
          }, child: Text("登录"),)
        ]));
  }
}
