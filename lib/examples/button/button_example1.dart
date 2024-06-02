import 'package:flutter/material.dart';

class ButtonExample1 extends StatelessWidget {
  final String title;

  const ButtonExample1({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("返回按钮"),
          BackButton(
            color: Colors.blue,
          ),
          Text(
            '''
          BackButton({  
            Key? key,  
            Color? color, 颜色
            ButtonStyle? style 按钮样式
            void Function()? onPressed, 按下事件,不写点击会直接返回上一页
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text("关闭按钮"),
          CloseButton(
            color: Colors.blue,
          ),
          Text(
            '''
          CloseButton({  
            Key? key,  
            Color? color, 颜色
            ButtonStyle? style 按钮样式
            void Function()? onPressed, 按下事件,不写点击当前页面会被关闭
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ]));
  }
}
