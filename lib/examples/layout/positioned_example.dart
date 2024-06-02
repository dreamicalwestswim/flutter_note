import 'package:flutter/material.dart';

/// 允许子组件绝对定位
/// Stack({
/// Key? key,
/// AlignmentGeometry alignment = AlignmentDirectional.topStart, 没有使用定位属性的对齐方式
/// TextDirection? textDirection, 文字对齐方式
/// StackFit fit = StackFit.loose, 此参数用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小。
/// Clip clipBehavior = Clip.hardEdge, 裁剪模式
/// List  children = const  [], 子元素
/// })

/// 绝对定位
/// Positioned({
/// Key? key,
/// double? left, 左
/// double? top, 上
/// double? right, 右
/// double? bottom, 下
/// double? width, 宽
/// double? height, 高
/// required Widget child, 子元素
/// })

class PositionedExample extends StatefulWidget {
  final String title;

  const PositionedExample({Key? key, required this.title}) : super(key: key);

  @override
  State<PositionedExample> createState() => _PositionedExampleState();
}

class _PositionedExampleState extends State<PositionedExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                children: <Widget>[
                  Container(
                    child: Text("Hello world",
                        style: TextStyle(color: Colors.white)),
                    color: Colors.red,
                  ),
                  Positioned(
                    left: 18.0,
                    child: Text("I am Jack"),
                  ),
                  Positioned(
                    top: 18.0,
                    child: Text("Your friend"),
                  )
                ],
              )),

              Expanded(
                  child: Stack(
                    alignment:Alignment.center ,
                    fit: StackFit.expand, //未定位widget占满Stack整个空间
                    children: <Widget>[
                      Positioned(
                        left: 18.0,
                        child: Text("I am Jack"),
                      ),
                      Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
                        color: Colors.red,
                      ),
                      Positioned(
                        top: 18.0,
                        child: Text("Your friend"),
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
