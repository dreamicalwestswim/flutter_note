import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


/// GestureDetector({
/// Key? key,
/// Widget? child,
/// void Function(TapDownDetails)? onTapDown, 按下
/// void Function(TapUpDetails)? onTapUp, 弹起
/// void Function()? onTap, 点击
/// void Function()? onTapCancel, 点击取消
/// void Function()? onSecondaryTap,
/// void Function(TapDownDetails)? onSecondaryTapDown,
/// void Function(TapUpDetails)? onSecondaryTapUp,
/// void Function()? onSecondaryTapCancel,
/// void Function(TapDownDetails)? onTertiaryTapDown,
/// void Function(TapUpDetails)? onTertiaryTapUp,
/// void Function()? onTertiaryTapCancel,
/// void Function(TapDownDetails)? onDoubleTapDown,
/// void Function()? onDoubleTap,
/// void Function()? onDoubleTapCancel,
/// void Function(LongPressDownDetails)? onLongPressDown,
/// void Function()? onLongPressCancel,
/// void Function()? onLongPress,
/// void Function(LongPressStartDetails)? onLongPressStart,
/// void Function(LongPressMoveUpdateDetails)? onLongPressMoveUpdate,
/// void Function()? onLongPressUp,
/// void Function(LongPressEndDetails)? onLongPressEnd,
/// void Function(LongPressDownDetails)? onSecondaryLongPressDown,
/// void Function()? onSecondaryLongPressCancel,
/// void Function()? onSecondaryLongPress,
/// void Function(LongPressStartDetails)? onSecondaryLongPressStart,
/// void Function(LongPressMoveUpdateDetails)? onSecondaryLongPressMoveUpdate,
/// void Function()? onSecondaryLongPressUp,
/// void Function(LongPressEndDetails)? onSecondaryLongPressEnd,
/// void Function(LongPressDownDetails)? onTertiaryLongPressDown,
/// void Function()? onTertiaryLongPressCancel,
/// void Function()? onTertiaryLongPress,
/// void Function(LongPressStartDetails)? onTertiaryLongPressStart,
/// void Function(LongPressMoveUpdateDetails)? onTertiaryLongPressMoveUpdate,
/// void Function()? onTertiaryLongPressUp,
/// void Function(LongPressEndDetails)? onTertiaryLongPressEnd,
/// void Function(DragDownDetails)? onVerticalDragDown,
/// void Function(DragStartDetails)? onVerticalDragStart,
/// void Function(DragUpdateDetails)? onVerticalDragUpdate,
/// void Function(DragEndDetails)? onVerticalDragEnd,
/// void Function()? onVerticalDragCancel,
/// void Function(DragDownDetails)? onHorizontalDragDown,
/// void Function(DragStartDetails)? onHorizontalDragStart,
/// void Function(DragUpdateDetails)? onHorizontalDragUpdate,
/// void Function(DragEndDetails)? onHorizontalDragEnd,
/// void Function()? onHorizontalDragCancel,
/// void Function(ForcePressDetails)? onForcePressStart,
/// void Function(ForcePressDetails)? onForcePressPeak,
/// void Function(ForcePressDetails)? onForcePressUpdate,
/// void Function(ForcePressDetails)? onForcePressEnd,
/// void Function(DragDownDetails)? onPanDown,
/// void Function(DragStartDetails)? onPanStart,
/// void Function(DragUpdateDetails)? onPanUpdate,
/// void Function(DragEndDetails)? onPanEnd,
/// void Function()? onPanCancel,
/// void Function(ScaleStartDetails)? onScaleStart,
/// void Function(ScaleUpdateDetails)? onScaleUpdate,
/// void Function(ScaleEndDetails)? onScaleEnd,
/// HitTestBehavior? behavior,
/// bool excludeFromSemantics = false,
/// DragStartBehavior dragStartBehavior = DragStartBehavior.start,
/// })

class GestureDetectorExample extends StatefulWidget {
  final String title;

  const GestureDetectorExample({Key? key, required this.title})
      : super(key: key);

  @override
  State<GestureDetectorExample> createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  String _operation = "No Gesture detected!"; //保存事件名

  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          // 点击、双击、长按
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200.0,
              height: 100.0,
              child: Text(
                _operation,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => updateText("Tap"), //点击
            onDoubleTap: () => updateText("DoubleTap"), //双击
            onLongPress: () => updateText("LongPress"), //长按
          ),
          // 拖动、滑动
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide()),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: _top,
                  left: _left,
                  child: GestureDetector(
                    child: CircleAvatar(child: Text("A")),
                    //手指按下时会触发此回调
                    onPanDown: (DragDownDetails e) {
                      //打印手指按下的位置(相对于屏幕)
                      print("用户手指按下：${e.globalPosition}");
                    },
                    //手指滑动时会触发此回调
                    onPanUpdate: (DragUpdateDetails e) {
                      //用户手指滑动时，更新偏移，重新构建
                      setState(() {
                        _left += e.delta.dx;
                        _top += e.delta.dy;
                      });
                    },
                    onPanEnd: (DragEndDetails e) {
                      //打印滑动结束时在x、y轴上的速度
                      print(e.velocity);
                    },
                  ),
                ),
                Positioned(
                  top: _top,
                  child: GestureDetector(
                    child: CircleAvatar(child: Text("B")),
                    //垂直方向拖动事件
                    onVerticalDragUpdate: (DragUpdateDetails e) {
                      setState(() {
                        _top += e.delta.dy;
                      });
                    },
                  ),
                ),
                Positioned(
                  left: _left,
                  child: GestureDetector(
                    child: CircleAvatar(child: Text("B")),
                    //水平方向拖动事件
                    onHorizontalDragUpdate: (DragUpdateDetails e) {
                      setState(() {
                        _left += e.delta.dx;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // 缩放
          GestureDetector(
            //指定宽度，高度自适应
            child: Image.asset("assets/images/guy.png", width: _width, fit: BoxFit.fitWidth,),
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                //缩放倍数在0.8到10倍之间
                _width=200*details.scale.clamp(.8, 10.0);
              });
            },
          ),

          // GestureRecognizer 识别器自定义识别
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "你好世界"),
                TextSpan(
                  text: "点我变色",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: _toggle ? Colors.blue : Colors.red,
                  ),
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      setState(() {
                        _toggle = !_toggle;
                      });
                    },
                ),
                TextSpan(text: "你好世界"),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
