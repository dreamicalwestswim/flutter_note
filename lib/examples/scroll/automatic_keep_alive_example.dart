import 'package:flutter/material.dart';

/// with AutomaticKeepAliveClientMixin 可以缓存不被卸载

class AutomaticKeepAliveExample extends StatefulWidget {
  final String title;

  const AutomaticKeepAliveExample({Key? key, required this.title}) : super(key: key);

  @override
  State<AutomaticKeepAliveExample> createState() => _AutomaticKeepAliveExampleState();
}

class _AutomaticKeepAliveExampleState extends State<AutomaticKeepAliveExample> {

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

class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    super.build(context); // 必须调用
    return Center(child: Text("${widget.text}", textScaleFactor: 5));
  }

  @override
  bool get wantKeepAlive => true; // 是否需要缓存

}