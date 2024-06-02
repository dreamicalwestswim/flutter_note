import 'dart:math';

import 'package:flutter/material.dart';

/// Container({
/// Key? key,
/// AlignmentGeometry? alignment, 内容对齐方式
/// EdgeInsetsGeometry? padding, 内填充
///  Color? color, 背景色
///  Decoration? decoration, 背景装饰
///  Decoration? foregroundDecoration, 前景装饰
///  double? width, 容器的宽度
///  double? height, 容器的高度
///  BoxConstraints? constraints, 容器大小的限制条件
///  EdgeInsetsGeometry? margin, 边界
///  Matrix4? transform, 矩阵变换
///  AlignmentGeometry? transformAlignment, 变换注册点
///  Widget? child, 子元素
/// Clip clipBehavior = Clip.none, 裁剪模式
/// })

class ContainerExample extends StatefulWidget {
  final String title;

  const ContainerExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ContainerExample> createState() => _ContainerExampleState();
}

class _ContainerExampleState extends State<ContainerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 120.0),
                constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),//卡片大小
                decoration: BoxDecoration(  //背景装饰
                  gradient: RadialGradient( //背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98,
                  ),
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    )
                  ],
                ),
                transform: Matrix4.rotationZ(.2),//卡片倾斜变换
                alignment: Alignment.center, //卡片内文字居中
                child: Text(
                  //卡片文字
                  "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
              ),

              Container(
                margin: EdgeInsets.all(20.0), //容器外补白
                color: Colors.orange,
                child: Text("Hello world!"),
              ),
              Container(
                padding: EdgeInsets.all(20.0), //容器内补白
                color: Colors.orange,
                child: Text("Hello world!"),
              ),
            ],
          ),
        ));
  }
}
