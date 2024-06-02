import 'package:flutter/material.dart';
import '../../events/event_bus.dart';

class EventBusExample extends StatefulWidget {
  final String title;

  const EventBusExample({Key? key, required this.title})
      : super(key: key);

  @override
  State<EventBusExample> createState() => _EventBusExampleState();
}

class _EventBusExampleState extends State<EventBusExample> {

  @override
  void initState() {
    //监听登录事件
    bus.on("login", (arg) {
      print(arg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              bus.emit('login', '123');
            },
            child: Text("广播事件"),
          )
        ],
      ),
    );
  }


}



