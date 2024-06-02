import 'package:flutter/material.dart';

class ButtonExample4 extends StatelessWidget {
  final String title;

  const ButtonExample4({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("文字按钮"),
          TextButton(onPressed: (){}, child: Text("TextButton")),
          Text(
            '''
          TextButton({  
            Key? key,   
            required void Function()? onPressed, 按下事件
            void Function()? onLongPress,   长按事件
            void Function(bool)? onHover,   hover事件
            void Function(bool)? onFocusChange,   聚焦变化事件
            ButtonStyle? style,   按钮样式
            FocusNode? focusNode,   FocusNode聚焦状态监听
            bool autofocus = false,   自动聚焦
            Clip clipBehavior = Clip.none,   裁剪模式
            MaterialStatesController? statesController 按钮状态控制
            bool? isSemanticButton = true, 语意按钮
            required Widget child,  子元素
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ]));
  }
}
