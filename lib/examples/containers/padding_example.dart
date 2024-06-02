import 'package:flutter/material.dart';

/// Padding({
/// Key? key,
/// padding, 填充方式
/// Widget? child 子元素
/// })

class PaddingExample extends StatefulWidget {
  final String title;

  const PaddingExample({Key? key, required this.title}) : super(key: key);

  @override
  State<PaddingExample> createState() => _PaddingExampleState();
}

class _PaddingExampleState extends State<PaddingExample> {
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
            children: const <Widget>[
              Padding(
                //左边添加8像素补白
                padding: EdgeInsets.only(left: 8),
                child: Text("Hello world"),
              ),
              Padding(
                //上下各添加8像素补白
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text("I am Jack"),
              ),
              Padding(
                // 分别指定四个方向的补白
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text("Your friend"),
              )
            ],
          ),
        )
    );
  }
}