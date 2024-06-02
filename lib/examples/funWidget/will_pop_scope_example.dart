import 'package:flutter/material.dart';

class WillPopScopeExample extends StatefulWidget {
  final String title;

  const WillPopScopeExample({Key? key, required this.title}) : super(key: key);

  @override
  State<WillPopScopeExample> createState() => _WillPopScopeExampleState();
}

class _WillPopScopeExampleState extends State<WillPopScopeExample> {
  DateTime? _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // 不允许关闭
      canPop: false,
      onPopInvoked: (bool didPop)  {
        // 关闭时didPop为true，返回不重复执行后面逻辑
        if (didPop)return;

        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
        } else {
          // 1秒以内点击两次手动关闭
          Navigator.pop(context);
        }

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        ),
      ),
    );
  }
}
