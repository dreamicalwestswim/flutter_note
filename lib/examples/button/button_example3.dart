import 'package:flutter/material.dart';

class ButtonExample3 extends StatelessWidget {
  final String title;

  const ButtonExample3({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("轮廓按钮"),
          OutlinedButton(onPressed: (){}, child: Text('OutlinedButton')),
          Text(
            '''
          OutlinedButton({  
            Key? key,   
            required void Function()? onPressed, 按下事件
            void Function()? onLongPress,  长按事件
            void Function(bool)? onHover,  hover事件
            void Function(bool)? onFocusChange,  聚焦变化事件
            ButtonStyle? style,   按钮样式
            FocusNode? focusNode,  FocusNode静态聚焦状态变化
            bool autofocus = false,   自动聚焦
            Clip clipBehavior = Clip.none,   裁剪模式
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
