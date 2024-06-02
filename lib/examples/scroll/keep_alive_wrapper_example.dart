import 'package:flutter/material.dart';

import '../../widgets/keep_alive_wrapper.dart';


class KeepAliveWrapperExample extends StatefulWidget {
  final String title;

  const KeepAliveWrapperExample({Key? key, required this.title}) : super(key: key);

  @override
  State<KeepAliveWrapperExample> createState() => _KeepAliveWrapperExampleState();
}

class _KeepAliveWrapperExampleState extends State<KeepAliveWrapperExample> {

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      //只需要用 KeepAliveWrapper 包装一下即可
      children.add(KeepAliveWrapper(child:Page( text: '$i')));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
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