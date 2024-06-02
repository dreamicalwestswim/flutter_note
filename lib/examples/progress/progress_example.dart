import 'package:flutter/material.dart';

/// LinearProgressIndicator({
/// Key? key,
/// double? value, 进度值0-1 如果为null会执行一个循环动画
/// Color? backgroundColor, 底色
/// Color? color, 进度色会被valueColor覆盖
/// Animation ? valueColor, 进度色
/// double? minHeight, 最小高度
/// String? semanticsLabel, 语义标签
/// String? semanticsValue, 语义值
/// })


/// CircularProgressIndicator({
/// Key? key,
/// double? value, 进度值0-1 如果为null会执行一个循环动画
/// Color? backgroundColor, 底色
/// Color? color, 进度色会被valueColor覆盖
/// Animation ? valueColor, 进度色
/// double strokeWidth = 4.0, 线条粗细
/// String? semanticsLabel, 语义标签
/// String? semanticsValue, 语义值
/// })

class ProgressExample extends StatefulWidget {
  final String title;

  const ProgressExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ProgressExample> createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Text("条状进度条"),
        // 模糊进度条(会执行一个动画)
        LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        //进度条显示50%
        LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          value: .5,
        ),

        Text("圆形进度条"),
        // 模糊进度条(会执行一个旋转动画)
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        //进度条显示50%，会显示一个半圆
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          value: .5,
        ),

        Text("自定义尺寸"),
        // 线性进度条高度指定为3
        SizedBox(
          height: 10,
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
        ),
        // 圆形进度条直径指定为100
        SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .7,
            strokeWidth: 10,
          ),
        ),
        // 宽高不等
        SizedBox(
          height: 100,
          width: 130,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .7,
          ),
        ),

        Text("进度色动画"),
        Padding(
          padding: EdgeInsets.all(16),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: ColorTween(begin: Colors.grey, end: Colors.blue).animate(_animationController), // 从灰色变成蓝色
            value: _animationController.value,
          ),
        )
      ]),
    );
  }
}
