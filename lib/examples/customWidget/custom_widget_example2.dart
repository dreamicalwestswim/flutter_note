import 'package:flutter/material.dart';

import '../../widgets/turn_box.dart';


class CustomWidgetExample2 extends StatefulWidget {
  final String title;

  const CustomWidgetExample2({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomWidgetExample2> createState() => _CustomWidgetExample2State();
}

class _CustomWidgetExample2State extends State<CustomWidgetExample2> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: const Icon(
                Icons.refresh,
                size: 50,
              ),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: const Icon(
                Icons.refresh,
                size: 150.0,
              ),
            ),
            ElevatedButton(
              child: const Text("顺时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns += .2;
                });
              },
            ),
            ElevatedButton(
              child: const Text("逆时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns -= .2;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}



/*---------------------有状态组件----------------------*/
// class MyRichText extends StatefulWidget {
//   MyRichText({
//     Key? key,
//     required this.text, // 文本字符串
//     this.linkStyle, // url链接样式
//   }) : super(key: key);
//
//   final String text;
//   final TextStyle? linkStyle;
//
//   @override
//   _MyRichTextState createState() => _MyRichTextState();
// }
//
// class _MyRichTextState extends State<MyRichText> {
//
//   late TextSpan _textSpan;
//
//   @override
//   void initState() {
//     _textSpan = parseText(widget.text);
//     super.initState();
//   }
//
//   @override
//   // 内部状态需要和外部同步，监听变化更新内部值
//   void didUpdateWidget(MyRichText oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.text != oldWidget.text) {
//       _textSpan = parseText(widget.text);
//     }
//   }
//
//   TextSpan parseText(String text) {
//     // 耗时操作：解析文本字符串，构建出TextSpan。
//     // 省略具体实现。
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: _textSpan,
//     );
//   }
// }