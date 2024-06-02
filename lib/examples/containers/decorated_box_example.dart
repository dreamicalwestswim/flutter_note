import 'package:flutter/material.dart';

/// DecoratedBox({
/// Key? key,
/// required Decoration decoration, 装饰对象
/// DecorationPosition position = DecorationPosition.background, 装饰位置和背景和前景
/// Widget? child, 子元素
/// })

/// BoxDecoration({
/// Color? color, 装饰颜色
/// DecorationImage? image, 装饰图片
/// BoxBorder? border, 边框
/// BorderRadiusGeometry? borderRadius, 边框半径
/// List ? boxShadow, 投影样式
/// Gradient? gradient, 渐变
/// BlendMode? backgroundBlendMode, 背景混合模式
/// BoxShape shape = BoxShape.rectangle, 形状
/// })

class DecoratedBoxExample extends StatefulWidget {
  final String title;

  const DecoratedBoxExample({Key? key, required this.title}) : super(key: key);

  @override
  State<DecoratedBoxExample> createState() => _DecoratedBoxExampleState();
}

class _DecoratedBoxExampleState extends State<DecoratedBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          //上下左右各添加16像素补白
          padding: const EdgeInsets.all(16),
          child: Column(
            //显式指定对齐方式为左对齐，排除对齐干扰
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange.shade700]), //背景渐变
                    borderRadius: BorderRadius.circular(3.0), //3像素圆角
                    boxShadow: [
                      //阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange.shade700]), //背景渐变
                    boxShadow: [
                      //阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              DecoratedBox(
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange.shade700]), //背景渐变
                    shadows: [
                      //阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ));
  }
}
