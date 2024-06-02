import 'package:flutter/material.dart';

class ButtonExample5 extends StatelessWidget {
  final String title;

  const ButtonExample5({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("按钮里面加图标"),
          ElevatedButton.icon(
            icon: Icon(Icons.send),
            label: Text("发送"),
            onPressed: () {},
          ),
          OutlinedButton.icon(
            icon: Icon(Icons.add),
            label: Text("添加"),
            onPressed: () {},
          ),
          TextButton.icon(
            icon: Icon(Icons.info),
            label: Text("详情"),
            onPressed: () {},
          ),
          Text("图标按钮"),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.thumb_up),
            iconSize: 20,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            splashRadius: 20,
            color: Colors.blue,
            focusColor: Colors.green,
            hoverColor: Colors.greenAccent,
            highlightColor: Colors.deepOrange,
            splashColor: Colors.deepPurple,
            disabledColor: Colors.black26,
            tooltip: "afsdfsdf",
          ),
          Text(
            '''
          IconButton({  
            Key? key,   
            double? iconSize,  图标大小
            VisualDensity? visualDensity,   视觉密度
            EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),  内填充
            AlignmentGeometry alignment = Alignment.center,   对齐方式
            double? splashRadius,   按下的闪烁半径
            Color? color,   颜色
            Color? focusColor,   聚焦颜色
            Color? hoverColor,   hover颜色
            Color? highlightColor,   高亮颜色
            Color? splashColor,   点击时闪过的颜色
            Color? disabledColor,   禁用颜色 onPressed = null才有效
            required void Function()? onPressed,   按下事件
            MouseCursor? mouseCursor,   鼠标样式
            FocusNode? focusNode,   FocusNode监听状态变化
            bool autofocus = false,   自动聚焦
            String? tooltip,   长按会出现提示文本
            bool enableFeedback = true,   
            BoxConstraints? constraints,   约束限制
            required Widget icon,  子元素
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ]));
  }
}
