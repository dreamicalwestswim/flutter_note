import 'package:flutter/material.dart';

class TextFieldExample5 extends StatefulWidget {
  final String title;

  const TextFieldExample5({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldExample5> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample5> {


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
              TextField(
                decoration: InputDecoration(
                  labelText: "请输入用户名",
                  prefixIcon: Icon(Icons.person),
                  // 未获得焦点下划线设为灰色
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  //获得焦点下划线设为蓝色
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),



              Theme(
                  data: Theme.of(context).copyWith(
                      hintColor: Colors.grey[200], //定义下划线颜色
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(color: Colors.grey),//定义label字体样式
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)//定义提示文本样式
                      )
                  ),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: "用户名",
                            hintText: "用户名或邮箱",
                            prefixIcon: Icon(Icons.person)
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: "密码",
                            hintText: "您的登录密码",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)
                        ),
                        obscureText: true,
                      )
                    ],
                  )
              ),



              Container(
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "电子邮件地址",
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none //隐藏下划线
                    )
                ),
                decoration: BoxDecoration(
                  // 下滑线浅灰色，宽度1像素
                    border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))
                ),
              )
            ],
          )),
    );
  }
}
