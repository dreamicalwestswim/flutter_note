import 'dart:math';

import 'package:flutter/material.dart';

/// OverflowBox({
/// Key? key,
/// AlignmentGeometry alignment = Alignment.center, 子组件对齐方式
/// double? minWidth, 最小宽度
/// double? maxWidth, 最大宽度
/// double? minHeight, 	最小高度
/// double? maxHeight, 最大高度
/// Widget? child, 子元素
/// })

/// SizedOverflowBox({
/// Key? key,
/// required Size size, 子组件对齐方式
/// AlignmentGeometry alignment = Alignment.center, 子组件对齐方式
/// Widget? child, 子元素
/// })

class OverflowBoxExample extends StatefulWidget {
  final String title;

  const OverflowBoxExample({Key? key, required this.title}) : super(key: key);

  @override
  State<OverflowBoxExample> createState() => _OverflowBoxExampleState();
}

class _OverflowBoxExampleState extends State<OverflowBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("OverflowBox子元素尺寸超过会被裁掉,不受上一层约束限制"),
                Container(
                  color: Colors.pink,
                  width: 200.0,
                  height: 200.0,
                  padding: const EdgeInsets.all(5.0),
                  child: OverflowBox(
                    alignment: Alignment.topLeft,
                    maxWidth: 300.0,
                    maxHeight: 300.0,
                    child: Container(
                      color: Colors.greenAccent,
                      width: 1000.0,
                      height: 1000.0,
                    ),
                  ),
                ),

                Text("SizedOverflowBox子元素超过不会被裁，会溢出显示"),
                Container(
                  color: Colors.orangeAccent,
                  alignment: Alignment.bottomRight,
                  width: 200.0,
                  height: 200.0,
                  // padding: EdgeInsets.all(5.0),
                  child: SizedOverflowBox(
                    size: Size(150.0, 200.0),
                    child: Container(
                      color: Colors.blueAccent,
                      width: 200.0,
                      height: 100.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
