import 'package:flutter/material.dart';

class ButtonExample2 extends StatelessWidget {
  final String title;

  const ButtonExample2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("投影按钮"),
          ElevatedButton(
            child: Text("ElevatedButton"),
            onPressed: () {
              print('按下阴影按钮');
            },
            onLongPress: () {
              print('长按阴影按钮');
            },
            onHover: (bool) {
              print('滑过阴影按钮$bool');
            },
            onFocusChange: (bool) {
              print('聚焦变化阴影按钮$bool');
            },
          ),
          Text(
            '''
          ElevatedButton({  
            Key? key,   
            required void Function()? onPressed,  按下事件
            void Function()? onLongPress,   长按事件
            void Function(bool)? onHover,   滑过事件
            void Function(bool)? onFocusChange,  聚焦变化事件
            ButtonStyle? style,   按钮样式
            FocusNode? focusNode,   通过FocusNode监听聚焦状态变化
            bool autofocus = false,   自动聚焦
            Clip clipBehavior = Clip.none,  裁剪模式
            required Widget? child,  子组件
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),

          Text("设置按钮样式"),
          ElevatedButton(
            child: Text("normal"),
            style: ButtonStyle(
              // 文字样式
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
              // 背景颜色
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                print(states);
                if (states.contains(MaterialState.pressed)) {
                  return Colors.blue[200];
                }
                return null;
              }),
              // 内容颜色
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.focused) &&
                    !states.contains(MaterialState.pressed)) {
                  return Colors.blue;
                } else if (states.contains(MaterialState.pressed)) {
                  return Colors.deepPurple;
                }
              }),
              // 波纹颜色
              overlayColor: MaterialStateProperty.all(Colors.green),
              // 投影颜色
              shadowColor: MaterialStateProperty.all(Colors.green),
              // 投影大小
              elevation: MaterialStateProperty.all(10),
              // 内填充
              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
              // 最小尺寸
              minimumSize: MaterialStateProperty.all(Size(100, 50)),
              // 固定尺寸
              fixedSize: MaterialStateProperty.all(Size(100, 50)),
              // 最大尺寸
              maximumSize: MaterialStateProperty.all(Size(100, 50)),
              // 边框样式
              side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 1)),
              // 按钮现状
              shape: MaterialStateProperty.all(StadiumBorder()),
              // 对齐方式
              alignment: AlignmentGeometry.lerp(AlignmentDirectional.topStart, AlignmentDirectional.topStart, 0),
            ),
            onPressed: () {},
          ),
          Text(
            '''
          ButtonStyle({  
            MaterialStateProperty ? textStyle, 文字样式
            MaterialStateProperty ? backgroundColor, 背景颜色
            MaterialStateProperty ? foregroundColor,  前景颜色
            MaterialStateProperty ? overlayColor,   水波纹颜色
            MaterialStateProperty ? shadowColor,   投影颜色
            MaterialStateProperty ? elevation,   阴影
            MaterialStateProperty ? padding,   填充
            MaterialStateProperty ? minimumSize,   最小尺寸
            MaterialStateProperty ? fixedSize,   固定尺寸
            MaterialStateProperty ? maximumSize,  最大尺寸
            MaterialStateProperty ? side,   边框
            MaterialStateProperty ? shape,   外边框装饰
            MaterialStateProperty ? mouseCursor,  鼠标样式
            VisualDensity? visualDensity,    视觉密度
            MaterialTapTargetSize? tapTargetSize,  可点击区域模式
            Duration? animationDuration,   动画持续时间
            bool? enableFeedback,   启用反馈
            AlignmentGeometry? alignment,   对齐方式
            InteractiveInkFeatureFactory? splashFactory, 飞溅工厂
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ]));
  }
}
