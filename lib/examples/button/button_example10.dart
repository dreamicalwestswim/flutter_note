import 'package:flutter/material.dart';

class ButtonExample10 extends StatelessWidget {
  final String title;

  const ButtonExample10({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("PopupMenuButton"),
          PopupMenuButton(
            itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(child: Text("DOTA"),value: "dota",height: 100,),
                PopupMenuItem(child: Text("英雄联盟"),value: "盖伦", enabled: false,),
                PopupMenuItem(child: Text("王者荣耀"),value: "name", textStyle: TextStyle(color: Colors.red),),
              ];
            },
            onSelected: (Object object){
              print(object);
            },
            onCanceled: (){
              print("canceled");
            },
            initialValue: "dota",
            color: Colors.yellow,
            icon: Icon(Icons.add),
            // child: Center(
            //   child: Text("游戏"),
            // ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 2,
                color: Colors.red,
                style: BorderStyle.solid,
              ),
            ),
              ),
          Text(
            '''
          PopupMenuButton({  
            Key? key,   
            required List  > Function(BuildContext) itemBuilder,   内容生成函数
            Object? initialValue,   默认值
            void Function()? onOpened,  弹出菜单被打开时的回调函数
            void Function(Object)? onSelected,   选择事件
            void Function()? onCanceled,   取消事件
            String? tooltip,   长按提示
            double? elevation,   弹出菜单的海拔高度
            Color? shadowColor,  弹出菜单的阴影颜色
            Color? surfaceTintColor,  弹出菜单表面的颜色
            EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),   内填充
            Widget? child,   子元素(可替换)
            double? splashRadius,  点击按钮时的波纹半径
            Widget? icon,   图标(可替换三个点)
            double? iconSize,   图标尺寸
            Offset offset = Offset.zero,   偏移
            bool enabled = true,   禁用
            ShapeBorder? shape,   形状
            Color? color,   颜色
            Color? iconColor,  图标的颜色
            bool? enableFeedback, 开启反馈
            BoxConstraints? constraints,   按钮的约束条件
            PopupMenuPosition? position,  弹出菜单的位置
            Clip clipBehavior = Clip.none,  弹出菜单的剪裁行为
            bool useRootNavigator = false,   是否在根导航器上打开菜单
            AnimationStyle? popUpAnimationStyle 弹出菜单的动画样式          
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text("子元素PopupMenuItem"),
          Text(
            '''
          PopupMenuItem({  
            Key? key,   
            String? value,   值
            void Function()? onTap,   点击
            bool enabled = true,   禁用
            double height = kMinInteractiveDimension,   高度
            EdgeInsets? padding,   内填充
            TextStyle? textStyle,   文字样式
            MaterialStateProperty<TextStyle?>? labelTextStyle 定义标签文本样式
            MouseCursor? mouseCursor,   鼠标样式
            required Widget? child, 子元素
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ]));
  }
}
