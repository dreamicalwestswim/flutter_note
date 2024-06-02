import 'package:flutter/material.dart';

/// ListView({
/// Key? key,
/// Axis scrollDirection = Axis.vertical, 滚动方向
/// bool reverse = false, 反向滚动
/// ScrollController? controller, 滚动控制器
/// bool? primary, //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
/// ScrollPhysics? physics, 滚动回弹 默认在 iOS 上会出现弹性效果，而在 Android 上会出现微光效果
/// bool shrinkWrap = false, 该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false 。默认情况下，ListView会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。
/// EdgeInsetsGeometry? padding, 内填充
/// double? itemExtent, 每一项的范围
/// Widget? prototypeItem, 列表项原型，滚动组件会在 layout 时计算一次它延主轴方向的长度
/// bool addAutomaticKeepAlives = true, 添加自动存档
/// bool addRepaintBoundaries = true, 该属性表示是否将列表项（子组件）包裹在RepaintBoundary组件中。
/// bool addSemanticIndexes = true, 添加语义索引
/// double? cacheExtent, 预渲染区域范围
/// List  children = const  [], 子元素
/// int? semanticChildCount, 预计子元素个数
/// DragStartBehavior dragStartBehavior = DragStartBehavior.start, 响应拖动的时机
/// ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, 滑动组件键盘隐藏模式
/// String? restorationId,
/// Clip clipBehavior = Clip.hardEdge, 裁剪模式
/// })


class ListViewExample extends StatefulWidget {
  final String title;

  const ListViewExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 显示进度条
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Container(
            color: Colors.black26,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.lightGreen,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.brown,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.blue,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.black26,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.lightGreen,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.brown,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.blue,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.black26,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.lightGreen,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.brown,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Container(
            color: Colors.blue,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
        ],
      ),
    );
  }
}
