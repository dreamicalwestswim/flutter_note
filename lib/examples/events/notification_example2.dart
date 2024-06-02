import 'package:flutter/material.dart';

class NotificationExample2 extends StatefulWidget {
  final String title;

  const NotificationExample2({Key? key, required this.title}) : super(key: key);

  @override
  State<NotificationExample2> createState() => _NotificationExample2State();
}

class _NotificationExample2State extends State<NotificationExample2> {
  String _msg="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          NotificationListener<MyNotification>(
            onNotification: (notification) {
              setState(() {
                _msg+=notification.msg+"  ";
              });
              return true;
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
//           ElevatedButton(
//           onPressed: () => MyNotification("Hi").dispatch(context),
//           child: Text("Send Notification"),
//          ),
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        //按钮点击时分发通知
                        onPressed: () => MyNotification("Hi").dispatch(context),
                        child: Text("Send Notification"),
                      );
                    },
                  ),
                  Text(_msg)
                ],
              ),
            ),
          ),

          NotificationListener<MyNotification>(
            onNotification: (notification){
              print(notification.msg); //打印通知
              return false;
            },
            child: NotificationListener<MyNotification>(
                onNotification: (notification) {
                  setState(() {
                    _msg+=notification.msg+"  ";
                  });
                  // 组织父级冒泡
                  return true;
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Builder(
                        builder: (context) {
                          return ElevatedButton(
                            //按钮点击时分发通知
                            onPressed: () => MyNotification("Hi").dispatch(context),
                            child: Text("Send Notification"),
                          );
                        },
                      ),
                      Text(_msg)
                    ],
                  ),
                ),
            ),
          )
        ],
      ),
    );
  }
}


class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}