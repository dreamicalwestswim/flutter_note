import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  final String title;

  const CheckboxExample({Key? key, required this.title}) : super(key: key);

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool? _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text('''
Checkbox({   
Key? key,   
required bool? value,   值
bool tristate = false,   开启三态 true/false/null
required void Function(bool?)? onChanged,  值变化回调
MouseCursor? mouseCursor,   鼠标样式
Color? activeColor,   激活态的颜色
MaterialStateProperty ? fillColor,   根据状态设置颜色
Color? checkColor,   check颜色(钩子颜色)
Color? focusColor,   聚焦颜色
Color? hoverColor,   hover颜色
MaterialStateProperty ? overlayColor,   波纹颜色
double? splashRadius,   波纹半径
MaterialTapTargetSize? materialTapTargetSize,   交互区域
VisualDensity? visualDensity,   视觉密度
FocusNode? focusNode,   聚焦状态监听
bool autofocus = false,   自动聚焦
OutlinedBorder? shape,   边框形状
BorderSide? side, 边框
})
          '''),
          UnconstrainedBox(
            alignment: Alignment.topLeft,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("通过状态设置颜色"),
              Checkbox(
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.blue;
                  } else {
                    return Colors.blue[300];
                  }
                }),
                splashRadius: 50,
                overlayColor: MaterialStateProperty.all(Colors.black12),
                value: _checkboxSelected!,
                //当前状态
                onChanged: (value) {
                  //重新构建页面
                  setState(() {
                    _checkboxSelected = value;
                  });
                },
              ),
              Text("通过单个颜色属性设置颜色"),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red,
                checkColor: Colors.green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                side: BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value;
                  });
                },
              ),
            ]),
          ),
        ]));
  }
}
