import 'package:flutter/material.dart';

class TextFieldExample3 extends StatefulWidget {
  final String title;

  const TextFieldExample3({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldExample3> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample3> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  void initState() {
    // 设置默认值
    _unameController.text = "hello world!";
    // 控制选中
    _unameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _unameController.text.length);
    _unameController.addListener(() {
      print(_unameController.text);
    });

    _passwordController.text = "123456";
    _passwordController.addListener(() {
      print(_passwordController.text);
    });
  }

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
            controller: _unameController,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person),
              suffixIcon: InkWell(
                onTap: () {
                  _unameController.clear();
                },
                child: Icon(Icons.close),
              ),
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: _isObscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
            obscureText: _isObscure,
            obscuringCharacter: "*",
          ),
          ElevatedButton(
            onPressed: () {
              print(_unameController.text);
              print(_passwordController.text);
            },
            child: Text("登录"),
          )
        ]));
  }
}
