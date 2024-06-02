import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RadioExample extends StatefulWidget {
  final String title;

  const RadioExample({Key? key, required this.title}) : super(key: key);

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  String _radioValue = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text('''
Radio({   
Key? key,   
required dynamic value,   自身值
required dynamic groupValue,   选中值
required void Function(dynamic)? onChanged,   值变化回调
MouseCursor? mouseCursor,   鼠标样式
bool toggleable = false,   可切换
Color? activeColor,   激活颜色
MaterialStateProperty ? fillColor,   状态控制颜色
Color? focusColor,   聚焦颜色
Color? hoverColor,   hover颜色
MaterialStateProperty ? overlayColor,   波纹颜色
double? splashRadius,   波纹半径
MaterialTapTargetSize? materialTapTargetSize,   交互区域
VisualDensity? visualDensity,   布局紧凑设置
FocusNode? focusNode,   焦点控制
bool autofocus = false, 自动聚焦
})
          '''),
          UnconstrainedBox(
            alignment: Alignment.topLeft,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("通过状态设置颜色"),
              Radio(
                  value: '1',
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value as String;
                    });
                  }),
              Radio(
                  value: '2',
                  groupValue: _radioValue,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _radioValue = value as String;
                    });
                  }),
            ]),
          ),
        ]));
  }
}
