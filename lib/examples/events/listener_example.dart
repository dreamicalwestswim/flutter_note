
import 'package:flutter/material.dart';

/// Listener({
/// Key? key,
/// void Function(PointerDownEvent)? onPointerDown, 手指按下回调
/// void Function(PointerMoveEvent)? onPointerMove, 手指移动回调
/// void Function(PointerUpEvent)? onPointerUp,  手指抬起回调
/// void Function(PointerHoverEvent)? onPointerHover, 鼠标hover回调
/// void Function(PointerCancelEvent)? onPointerCancel, 触摸事件取消回调
/// void Function(PointerSignalEvent)? onPointerSignal,
/// HitTestBehavior behavior = HitTestBehavior.deferToChild, 子组件如何响应命中测试
/// Widget? child,
/// })

/// AbsorbPointer({
/// Key? key,
/// bool absorbing = true, 忽略子元素事件
/// Widget? child,
/// bool? ignoringSemantics, 忽略语义
/// })

/// IgnorePointer({
/// Key? key,
/// bool ignoring = true, 忽略指针事件
/// bool? ignoringSemantics, 忽略语义
/// Widget? child,
/// })

class ListenerExample extends StatefulWidget {
  final String title;

  const ListenerExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ListenerExample> createState() => _ListenerExampleState();
}

class _ListenerExampleState extends State<ListenerExample> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300.0,
              height: 150.0,
              child: Column(
                children: [
                  Text(
                    '全局坐标：${_event?.position ?? ''}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '本地坐标：${_event?.localPosition ?? ''}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            onPointerDown: (PointerDownEvent event) => setState(()  {
              _event = event;
              print(event.orientation); // 方向
              print(event.pressure); // 按压力度
              print(event.delta); // 两次指针移动事件（PointerMoveEvent）的距离。
              print(event.localDelta); // 两次指针移动事件（PointerMoveEvent）的本地距离。
              print(event.position); // 它是指针相对于当对于全局坐标的偏移。
              print(event.localPosition); // 是指针相对于当对于本身布局坐标的偏移。
            }),
            onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
            onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
          ),

          Text("忽略子元素指针事件,自身有效"),
          Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event)=>print("in"),
              ),
            ),
            onPointerDown: (event)=>print("up"),
          ),

          Text("忽略指针事件，自身与子元素都失效"),
          Listener(
            child: IgnorePointer(
              child: Listener(
                child: Container(
                  color: Colors.black26,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event)=>print("in"),
              ),
            ),
            onPointerDown: (event)=>print("up"),
          )

        ],
      ),
    );
  }
}
