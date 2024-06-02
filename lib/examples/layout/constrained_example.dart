import 'package:flutter/material.dart';


/// ConstrainedBox({
/// Key? key,
/// required BoxConstraints constraints, 限制尺寸
/// Widget? child, 自元素
/// })

/// SizedBox({
/// Key? key,
/// double? width, 宽
/// double? height, 高
/// Widget? child, 子元素
/// })

/// UnconstrainedBox({
/// Key? key,
/// Widget? child, 子元素
/// TextDirection? textDirection, 文字方向
/// AlignmentGeometry alignment = Alignment.center, 居中对齐
/// Axis? constrainedAxis, 受约束的轴
/// Clip clipBehavior = Clip.none, 裁剪模式
/// })

/// AspectRatio({
/// Key? key,
/// required double aspectRatio, 约束长宽比 1/2
/// Widget? child, 子元素
/// })

/// LimitedBox({
/// Key? key,
/// double maxWidth = double.infinity, 最大宽
/// double maxHeight = double.infinity, 最大高
/// Widget? child, 子元素
/// })

/// FractionallySizedBox({
/// Key? key,
/// AlignmentGeometry alignment = Alignment.center, 居中对齐
/// double? widthFactor, 宽度比例 0-1
/// double? heightFactor, 高度比例 0-1
/// Widget? child, 子元素
/// })

class ConstrainedExample extends StatefulWidget {
  final String title;

  const ConstrainedExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ConstrainedExample> createState() => _ConstrainedExampleState();
}

class _ConstrainedExampleState extends State<ConstrainedExample>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: <Widget>[
        Text("未约束样式"),
        Container(
          height: 5.0,
          color: Colors.green,
        ),
        SizedBox(height: 50,),

        Text("ConstrainedBox对子组件添加额外的约束"),
        Text("ConstrainedBox用BoxConstraints来设置约束，同时支持最大和最小约束尺寸，可以用来控制尺寸范围，或者实现特殊的约束"),
        ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: double.infinity, //宽度尽可能大
              minHeight: 50.0 //最小高度为50像素
          ),
          child: Container(
            height: 5.0,
            color: Colors.green,
          ),
        ),


        SizedBox(height: 50,),
        Text("SizedBox用于给子元素指定固定的宽高"),
        UnconstrainedBox(
          alignment: Alignment.centerLeft,
          child:  SizedBox(
            width: 80.0,
            height: 80.0,
            child: Container(
              height: 5.0,
              color: Colors.green,
            ),
          ),
        ),


        SizedBox(height: 50,),
        Text("UnconstrainedBox解除子组件被父组件约束限制，自身无法解除"),
        Text("当我们发现已经使用 SizedBox 或 ConstrainedBox给子元素指定了固定宽高，但是仍然没有效果时，几乎可以断定：已经有父组件指定了约束！"),
        ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
            child: UnconstrainedBox( //“去除”父级限制
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                child: Container(
                  height: 5.0,
                  color: Colors.green,
                ),
              ),
            )
        ),


        AppBar(
          title: Text("AppBar默认有约束"),
          actions: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            )
          ],
        ),
        AppBar(
          title: Text("去除子组件约束"),
          actions: <Widget>[
            UnconstrainedBox(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            )
          ],
        ),

        SizedBox(height: 50,),
        Text("AspectRatio指定子组件的长宽比"),
        UnconstrainedBox(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 100,
            child: AspectRatio(
              aspectRatio: 2 / 1.0,
              child: Container(
                color: Colors.green,
              ),
            ),
          ),
        ),

        SizedBox(height: 50,),
        Text("LimitedBox指定子组件的最大宽高"),
        UnconstrainedBox(
          alignment: Alignment.centerLeft,
          child: LimitedBox(
            maxWidth: 200,
            maxHeight: 100,
            child: Container(
              width: 500,
              height: 500,
              color: Colors.green,
            ),
          ),
        ),


        SizedBox(height: 50,),
        Text("FractionallySizedBox根据父容器宽高的百分比来设置子组件宽高"),
        UnconstrainedBox(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 100,
            height: 100,
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: .5,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
          ),
        ),

      ]),
    );
  }
}
