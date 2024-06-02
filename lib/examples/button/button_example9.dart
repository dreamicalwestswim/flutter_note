import 'package:flutter/material.dart';

class ButtonExample9 extends StatelessWidget {
  final String title;

  const ButtonExample9({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("无默认样式按钮"),
          RawMaterialButton(
            onPressed: () {},
            child: Text('RawMaterialButton无默认样式的按钮'),
            //文字样式
            textStyle: TextStyle(color: Colors.white),
            //背景色
            fillColor: Colors.orange,
            //高亮时背景色
            highlightColor: Colors.red,
            //阴影
            highlightElevation: 10.0,
            //按下时水波纹颜色
            splashColor: Colors.blue,
            //抗锯齿等级
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsets.all(20.0),
          ),
          Text(
            '''
          RawMaterialButton({  
            Key? key,   
            required void Function()? onPressed,  点击事件
            void Function()? onLongPress,   长按事件
            void Function(bool)? onHighlightChanged,   按下、弹起事件
            MouseCursor? mouseCursor,   鼠标样式
            TextStyle? textStyle,   文字样式
            Color? fillColor,   填充颜色
            Color? focusColor,   聚焦颜色
            Color? hoverColor,   hover颜色
            Color? highlightColor,   高亮颜色
            Color? splashColor,   闪烁颜色
            double elevation = 2.0,   投影
            double focusElevation = 4.0,   聚焦投影
            double hoverElevation = 4.0,   hover投影
            double highlightElevation = 8.0,   高亮投影
            double disabledElevation = 0.0,   禁用投影
            EdgeInsetsGeometry padding = EdgeInsets.zero,   内填充
            VisualDensity visualDensity = VisualDensity.standard,   视觉密度
            BoxConstraints constraints = const BoxConstraints(minWidth: 88.0, minHeight: 36.0),   约束条件
            ShapeBorder shape = const RoundedRectangleBorder(),   Duration animationDuration = kThemeChangeDuration,   形状
            Clip clipBehavior = Clip.none,   裁剪模式
            FocusNode? focusNode,   监听聚焦状态
            bool autofocus = false,   自动聚焦
            MaterialTapTargetSize? materialTapTargetSize,   点击区域模式
            Widget? child,   子元素
            bool enableFeedback = true, 开启反馈
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ]));
  }
}
