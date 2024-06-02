import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// RichText 富文本，不继承父级样式
/// text, 显示的文字
/// textAlign, 对齐方式
/// textDirection, 排列方式
/// softWrap, 是否换行
/// overflow, 超出容器的展示方式
/// textScaleFactor, 文字比例
/// maxLines, 最大行数
/// locale, 选择用户语言和格式的标识符
/// strutStyle, 字体在文本内的一些偏移
/// textWidthBasis, 测量行宽度,一行或多行文本宽度的不同方式
/// textHeightBehavior, 定义如何应用第一行的ascent和最后一行的descent

/// Text.rich 富文本
/// textSpan TextSpan组件
/// style, 文字样式
/// strutStyle, 字体在文本内的一些偏移
/// textAlign, 对齐方式
/// textDirection, 排列方式
/// locale, 选择用户语言和格式的标识符
/// softWrap, 是否换行
/// overflow, 超出容器的展示方式
/// textScaleFactor, 文字比例
/// maxLines, 最大行数
/// semanticsLabel, 语义标签，如文本为"$$"，这里设置为"双美元"
/// textWidthBasis, 测量行宽度,一行或多行文本宽度的不同方式
/// textHeightBehavior, 定义如何应用第一行的ascent和最后一行的descent

/// TextSpan 用于指定文本片段的样式及手势交互
/// String? text, 显示的文字
/// List ? children, 子元素集合
/// TextStyle? style, 样式
/// GestureRecognizer? recognizer, 手势
/// MouseCursor? mouseCursor, 鼠标样式
/// void Function(PointerEnterEvent)? onEnter, 鼠标进入
/// void Function(PointerExitEvent)? onExit, 鼠标离开
/// String? semanticsLabel, 语意标签
/// Locale? locale, 选择用户语言和格式的标识符
/// bool? spellOut,

class TextSpanExample extends StatelessWidget {
  final String title;

  const TextSpanExample({Key? key, required this.title}) : super(key: key);

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
          Text(
            'Text.rich > TextSpan',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text.rich(TextSpan(text: "124", children: [
            TextSpan(text: "home:"),
            TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
                onEnter: (PointerEnterEvent e) {
                  print(e.position);
                  print('鼠标滑过');
                },
                onExit: (PointerExitEvent e) {
                  print(e.position);
                  print('鼠标离开');
                },
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('https://flutterchina.club');
                  }),
            WidgetSpan(child: Icon(Icons.home)),
          ])),
          Text(
            'RichText > TextSpan',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                      text: "《上阳赋》自然引来众多关注。章子怡早年凭借出演张艺谋的电影《我的父亲母亲》走红",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('"点击了上阳赋');
                        }),
                  TextSpan(
                      text: "安全协议",
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                      //点击事件
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("点击了安全协议");
                        })
                ],
              ))
        ],
      ),
    );
  }
}
