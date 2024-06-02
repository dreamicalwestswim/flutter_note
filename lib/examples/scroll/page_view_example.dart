import 'package:flutter/material.dart';

/// PageView({
/// Key? key,
/// Axis scrollDirection = Axis.horizontal, 滑动方向
/// bool reverse = false, 反向滑动
/// PageController? controller, 控制器
/// ScrollPhysics? physics, 回弹效果
/// bool pageSnapping = true, 每次滑动是否强制切换整个页面，如果为false，则会根据实际的滑动距离显示页面
/// void Function(int)? onPageChanged, 页面切换触发
/// List  children = const  [], 子元素
/// DragStartBehavior dragStartBehavior = DragStartBehavior.start,
/// bool allowImplicitScrolling = false, 缓存前后一页不被卸载
/// String? restorationId,
/// Clip clipBehavior = Clip.hardEdge,
/// ScrollBehavior? scrollBehavior,
/// bool padEnds = true, 未知
/// })

class PageViewExample extends StatefulWidget {
  final String title;

  const PageViewExample({Key? key, required this.title}) : super(key: key);

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add( Page( text: '$i'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
        allowImplicitScrolling: true,
        children: children,
      ),
    );
  }
}


// Tab 页面
class Page extends StatefulWidget {
  const Page({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(child: Text("${widget.text}", textScaleFactor: 5));
  }
}