import 'package:flutter/material.dart';

/// DefaultTextStyle 设置默认文本样式
/// style, 样式
/// textAlign, 对齐方式
/// softWrap = true, 自动换行
/// overflow = TextOverflow.clip, 超出裁剪
/// maxLines, 最大行数
/// textWidthBasis = TextWidthBasis.parent, 宽度模式
/// textHeightBehavior, 高度模式

class DefaultTextStyleExample extends StatelessWidget {
  final String title;

  const DefaultTextStyleExample({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5e5e5),
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hello world"),
                Text("I am Jack"),
                Text(
                  "I am Jack",
                  style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
