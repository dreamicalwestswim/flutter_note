import 'dart:math';

import 'package:flutter/material.dart';

/// Transform({
/// Key? key,
/// required this.transform, 变换值
/// this.origin, 源
/// this.alignment, 注册点对齐方式
/// this.transformHitTests = true, 转换的碰撞区域生效
/// this.filterQuality, 滤镜质量
/// Widget? child, 子元素
/// })

class TransformExample extends StatefulWidget {
  final String title;

  const TransformExample({Key? key, required this.title}) : super(key: key);

  @override
  State<TransformExample> createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> {
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
                color: Colors.black,
                margin: EdgeInsets.only(bottom: 10),
                child: Transform(
                  alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                  transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.deepOrange,
                    child: const Text('Apartment for rent!'),
                  ),
                ),
              ),


              Text("Transform.translate(平移)"),
              Container(
                color: Colors.red,
                margin: EdgeInsets.only(bottom: 10),
                //默认原点为左上角，左移20像素，向上平移5像素
                child: Transform.translate(
                  offset: Offset(-20.0, -5.0),
                  child: Text("Hello world"),
                ),
              ),

              Text("Transform.rotate(旋转)"),
              Container(
                color: Colors.red,
                margin: EdgeInsets.only(bottom: 10),
                child: Transform.rotate(
                  //旋转90度
                  angle:pi/2 ,
                  child: Text("Hello world"),
                ),
              ),

              Text("Transform.scale(缩放)"),
              Container(
                color: Colors.red,
                margin: EdgeInsets.only(bottom: 10),
                child: Transform.scale(
                    scale: 1.5, //放大到1.5倍
                    child: Text("Hello world")
                ),
              ),

              Text("Transform.flip(翻转)"),
              Container(
                color: Colors.red,
                margin: EdgeInsets.only(bottom: 10),
                child: Transform.flip(
                    flipX: true,
                    child: Text("Hello world")
                ),
              ),


              Text("Transform 注意事项,变换后元素大小和位置不会发生改变，只是视觉改变了而已"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                      decoration:BoxDecoration(color: Colors.red),
                      child: Transform.scale(scale: 1.5,
                          child: Text("Hello world")
                      )
                  ),
                  Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
                ],
              ),

              Text("RotatedBox(布局阶段设置,元素位置会发生变化)"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    //将Transform.rotate换成RotatedBox
                    child: RotatedBox(
                      quarterTurns: 1, //旋转90度(1/4圈)
                      child: Text("Hello world"),
                    ),
                  ),
                  Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
                ],
              ),
            ],
          ),
        ));
  }
}
