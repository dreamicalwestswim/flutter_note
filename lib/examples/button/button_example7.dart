import 'package:flutter/material.dart';

class ButtonExample7 extends StatelessWidget {
  final String title;

  const ButtonExample7({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("Material风格按钮"),
        MaterialButton(
          ///按钮的背景
          color: Colors.blue,

          child: Text("按钮"),
          ///点击回调函数
          onPressed: (){
            print("按钮点击");
          },
          ///按钮按下时回调 value = true
          ///按钮抬起时回调 value = false
          ///要先于 onPressed
          onHighlightChanged: (value){
            print("按钮点击 Hight $value");
          },
          ///定义按钮的基色，以及按钮的最小尺寸
          ///ButtonTextTheme.accent 按钮显示的文本 ThemeData.accentColor(MaterialApp组件中的theme属性配制的)
          ///ButtonTextTheme. normal 按钮显示的文本 黑色或者白色 具体取决于ThemeData.brightness Brightness.dark
          ///ButtonTextTheme.primary 按钮的显示的文本 ThemeData.primaryColr
          textTheme: ButtonTextTheme.primary,
          ///配制按钮上文本的颜色
          textColor: Colors.deepOrange,
          ///未设置点击时的背景颜色
          disabledColor:Colors.yellow ,
          ///按钮点击下的颜色
          highlightColor:Colors.deepPurple,
          ///水波方的颜色
          splashColor: Colors.green,
          ///按钮的阴影
          elevation: 10,
          ///按钮按下时的阴影高度
          highlightElevation: 20,
          ///未设置点击时的阴影高度
          disabledElevation: 5.0,
          ///用来设置按钮的边框的样式
          /// Border.all(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid) 四个边框
          /// Border(bottom: BorderSide(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid)) 可以分别设置边框
          /// 用来设置底部边框的
          /// UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid),borderRadius: BorderRadius.circular(10))
          /// 用来设置圆角矩形边框
          ///   RoundedRectangleBorder(side: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(20)))
          ///   用来设置圆形边框
          ///   CircleBorder(side: BorderSide(width: 2,color:Colors.red )),
          ///   椭圆形边框 StadiumBorder(side: BorderSide(width: 2,color: Colors.red))
          ///   设置 多边形 BeveledRectangleBorder(side: BorderSide(width: 2,color: Colors.red),borderRadius: BorderRadius.all(Radius.circular(20)))
          ///
          shape: Border.all(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid),
          height: 44.0,
          minWidth: 140,
        ),
          Text(
            '''
          MaterialButton({  
            Key? key,   
            required void Function()? onPressed,   点击事件
            void Function()? onLongPress,   长按事件
            void Function(bool)? onHighlightChanged,   按下、弹起事件
            MouseCursor? mouseCursor,   鼠标样式
            ButtonTextTheme? textTheme,   文字主题
            Color? textColor,   文字颜色
            Color? disabledTextColor,   禁用文字颜色
            Color? color,   颜色
            Color? disabledColor,   禁用颜色
            Color? focusColor,   聚焦颜色
            Color? hoverColor,   hover颜色
            Color? highlightColor,   高亮颜色
            Color? splashColor,   闪烁颜色
            Brightness? colorBrightness,   颜色亮度
            double? elevation,   投影
            double? focusElevation,   聚焦投影
            double? hoverElevation,   hover投影
            double? highlightElevation,   高亮投影
            double? disabledElevation,   禁用投影
            EdgeInsetsGeometry? padding,   内填充
            VisualDensity? visualDensity,   视觉密度
            ShapeBorder? shape,   形状
            Clip clipBehavior = Clip.none,   裁剪模式
            FocusNode? focusNode,   监听状态变化
            bool autofocus = false,   自动聚焦
            MaterialTapTargetSize? materialTapTargetSize,   点击区域模式
            Duration? animationDuration,   动画延迟时间
            double? minWidth,   最小宽度
            double? height,   高度
            bool enableFeedback = true,   开启反馈
            Widget? child, 子元素
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ]));
  }
}
