import 'package:flutter/material.dart';

class ButtonExample6 extends StatelessWidget {
  final String title;

  const ButtonExample6({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("浮动操作按钮"),
          FloatingActionButton(onPressed: (){}, child: Icon(Icons.add)),
          Text(
            '''
          FloatingActionButton({  
            Key? key,   
            Widget? child,  子元素
            String? tooltip,  长按提示文字
            Color? foregroundColor,   前景颜色
            Color? backgroundColor,   背景颜色
            Color? focusColor,   聚焦颜色
            Color? hoverColor,   hover颜色
            Color? splashColor,   点击闪烁的颜色
            Object? heroTag = const _DefaultHeroTag(), 位置属性
            double? elevation,   投影
            double? focusElevation,   聚焦投影
            double? hoverElevation,   hover投影
            double? highlightElevation,   高亮投影
            double? disabledElevation,   禁用投影
            required void Function()? onPressed,   按下事件
            MouseCursor? mouseCursor,   鼠标样式
            bool mini = false,   默认 false，默认按钮为 56 * 56，当mini 为 true 时，默认大小为 40 * 40，边框padding 各为 4，所以布局大小为 48 * 48
            ShapeBorder? shape,   自定义形状
            Clip clipBehavior = Clip.none,   裁剪模式
            FocusNode? focusNode,   聚焦状态监听
            bool autofocus = false,   自动聚焦
            MaterialTapTargetSize? materialTapTargetSize,   点击区域大小，MaterialTapTargetSize.padded时最小点击区域为48*48，MaterialTapTargetSize.shrinkWrap 时为子组件的实际大小。
            bool isExtended = false,  默认为 false，当使用 extended 方法时为 true
            bool? enableFeedback, 开启反馈
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ]));
  }
}
