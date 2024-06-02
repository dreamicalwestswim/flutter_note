import 'package:flutter/material.dart';

class NotificationExample extends StatefulWidget {
  final String title;

  const NotificationExample({Key? key, required this.title}) : super(key: key);

  @override
  State<NotificationExample> createState() => _NotificationExampleState();
}

class _NotificationExampleState extends State<NotificationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: NotificationListener(
              onNotification: (notification) {
                switch (notification.runtimeType) {
                  case ScrollStartNotification:
                    print("开始滚动");
                    break;
                  case ScrollUpdateNotification:
                    print("正在滚动");
                    break;
                  case ScrollEndNotification:
                    print("滚动停止");
                    break;
                  case OverscrollNotification:
                    print("滚动到边界");
                    break;
                }
                // 当返回值为true时，阻止冒泡，其父级Widget将再也收不到该通知；当返回值为false 时继续向上冒泡通知。
                return false;
              },
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("$index"),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 200,
            //指定监听通知的类型为滚动结束通知(ScrollEndNotification)
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {
                switch (notification.runtimeType) {
                  case ScrollStartNotification:
                    print("开始滚动");
                    break;
                  case ScrollUpdateNotification:
                    print("正在滚动");
                    break;
                  case ScrollEndNotification:
                    print("滚动停止");
                    break;
                  case OverscrollNotification:
                    print("滚动到边界");
                    break;
                }
                return false;
              },
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("$index"),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
