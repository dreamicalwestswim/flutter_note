import 'package:flutter/material.dart';

/// 弹性布局容器
/// Wrap({
/// Key? key,
/// Axis direction = Axis.horizontal, 布局方向
/// WrapAlignment alignment = WrapAlignment.start, 主轴对齐方式
/// double spacing = 0.0, 主轴间距
/// WrapAlignment runAlignment = WrapAlignment.start, 纵轴方向的对齐方式
/// double runSpacing = 0.0, 纵轴方向的间距
/// WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
/// TextDirection? textDirection, 文字方向
/// VerticalDirection verticalDirection = VerticalDirection.down, 垂直方向
/// Clip clipBehavior = Clip.none, 裁剪模式
/// List  children = const  [], 子元素
/// })


class WrapExample extends StatefulWidget {
  final String title;

  const WrapExample({Key? key, required this.title}) : super(key: key);

  @override
  State<WrapExample> createState() => _WrapExampleState();
}

class _WrapExampleState extends State<WrapExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Wrap(
              spacing: 8.0, // 主轴(水平)方向间距
              runSpacing: 4.0, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                  label: Text('Hamilton'),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                  label: Text('Lafayette'),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                  label: Text('Mulligan'),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                  label: Text('Laurens'),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                  label: Text('Laurens'),
                ),
              ],
            )
          ],
        ));
  }
}
