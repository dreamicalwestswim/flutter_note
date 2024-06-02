import 'package:flutter/material.dart';

/// 向新路由传递参数，直接往构造函数里面写参数即可，类里面接受这个参数
/// TipRoute(text: "我是提示上一个页面传递过来的参数");

/// 页面退出向上级返回数据，直接在pop里面第二个参数写数据，外部可监听到这个参数
/// Navigator.pop(context, "我是子页面的返回值")



class RouteArgumentsExample extends StatelessWidget {
  final String title;

  const RouteArgumentsExample({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("打开新页面并传参数过去"),
              onPressed: () async {
                // 打开`TipRoute`，并等待返回结果
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TipRoute(
                        // 路由参数
                        text: "我是上一个页面传递过来的参数",
                      );
                    },
                  ),
                );
                //输出`TipRoute`路由返回结果
                print("路由返回值: $result");
              },
            )
          ],
        ),
      ),
    );
  }
}


class TipRoute extends StatelessWidget {
  TipRoute({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是子页面的返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
