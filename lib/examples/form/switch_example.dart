import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SwitchExample extends StatefulWidget {
  final String title;

  const SwitchExample({Key? key, required this.title}) : super(key: key);

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool _switchSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text('''
Switch({   
Key? key,   
required bool value,   值 true/false
required void Function(bool)? onChanged,  开关回调
Color? activeColor,   激活颜色(控制轨迹和滑块颜色)
Color? activeTrackColor,   活动轨迹颜色(覆盖activeColor轨迹颜色)
Color? inactiveThumbColor,   非活动滑块颜色
Color? inactiveTrackColor,   非活动轨迹颜色
ImageProvider ? activeThumbImage,   活动滑块图片
void Function(Object, StackTrace?)? onActiveThumbImageError,   活动滑块图片出错处理
ImageProvider ? inactiveThumbImage,   非活动滑块图片
void Function(Object, StackTrace?)? onInactiveThumbImageError,   非活动滑块图片出错处理
MaterialStateProperty ? thumbColor,   根据状态设置滑块颜色
MaterialStateProperty ? trackColor,   根据状态设置轨迹颜色
MaterialTapTargetSize? materialTapTargetSize,   交互区域
DragStartBehavior dragStartBehavior = DragStartBehavior.start,   滑块初始位置
MouseCursor? mouseCursor,   鼠标样式
Color? focusColor,   聚焦颜色
Color? hoverColor,   hover颜色
MaterialStateProperty ? overlayColor,   波纹颜色
double? splashRadius,   波纹半径
FocusNode? focusNode,   聚焦状态监听
bool autofocus = false, 自动聚焦
})
          '''),

          UnconstrainedBox(
            alignment: Alignment.topLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("通过状态设置颜色"),
              Switch(
                thumbColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.blue;
                  } else {
                    return Colors.blue[300];
                  }
                }),
                trackColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.grey;
                  } else {
                    return Colors.black12;
                  }
                }),
                splashRadius: 50,
                overlayColor: MaterialStateProperty.all(Colors.black12),
                value: _switchSelected,
                //当前状态
                onChanged: (value) {
                  //重新构建页面
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Text("通过单个颜色属性设置颜色"),
              Switch(
                activeColor: Colors.deepOrange,
                activeTrackColor: Colors.brown,
                inactiveThumbColor: Colors.cyan,
                inactiveTrackColor: Colors.cyanAccent,
                splashRadius: 50,
                overlayColor: MaterialStateProperty.all(Colors.black12),
                value: _switchSelected,
                //当前状态
                onChanged: (value) {
                  //重新构建页面
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Text("通过图片设置滑块样式"),
              Switch(
                activeThumbImage: AssetImage('assets/images/guy.png'),
                inactiveThumbImage: NetworkImage('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
                splashRadius: 50,
                overlayColor: MaterialStateProperty.all(Colors.black12),
                value: _switchSelected, //当前状态
                onChanged: (value) {
                  //重新构建页面
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
            ]),
          ),
        ]));
  }
}


