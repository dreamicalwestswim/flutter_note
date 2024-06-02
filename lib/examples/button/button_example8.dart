import 'package:flutter/material.dart';

class ButtonExample8 extends StatelessWidget {
  final String title;

  const ButtonExample8({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("TextSelectionToolbarTextButton"),
          TextSelectionToolbarTextButton(
            padding: EdgeInsets.all(10),
            child: Text('TextSelectionToolbarTextButton'),
            onPressed: (){
              print('点击');
            },
          ),
          Text(
            '''
          TextSelectionToolbarTextButton({  
            Key? key,   
            required Widget child,   子元素
            required EdgeInsets padding,   内填充
            void Function()? onPressed,  点击事件
            AlignmentGeometry? alignment, 对齐方式
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ]));
  }
}
