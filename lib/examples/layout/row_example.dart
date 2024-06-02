import 'package:flutter/material.dart';

/// Row({
/// Key? key,
/// MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,   主轴对其方式(水平)
/// MainAxisSize mainAxisSize = MainAxisSize.max, 主轴尺寸
/// CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, 纵轴对其方式(垂直)
/// TextDirection? textDirection, 文字方向
/// VerticalDirection verticalDirection = VerticalDirection.down, 垂直方向
/// TextBaseline? textBaseline, 文本基线
/// List  children = const  [], 子元素
/// })

class RowExample extends StatefulWidget {
  final String title;

  const RowExample({Key? key, required this.title}) : super(key: key);

  @override
  State<RowExample> createState() => _RowExampleState();
}

class _RowExampleState extends State<RowExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: <Widget>[
        Text(
          "主轴对其方式：",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        Text("MainAxisAlignment.start(左对齐)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
            ],
          ),
        ),

        Text("MainAxisAlignment.center(水平居中对齐)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
            ],
          ),
        ),

        Text("MainAxisAlignment.end(右对齐)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
            ],
          ),
        ),

        Text("MainAxisAlignment.spaceAround(每个项目两边都分配一样的空间)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
            ],
          ),
        ),

        Text("MainAxisAlignment.spaceBetween(左右两端对其，中间的平均分配剩余空间)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box3"),
              ),
            ],
          ),
        ),

        Text("MainAxisAlignment.spaceEvenly(所有项目均匀分布)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
            ],
          ),
        ),


        Text(
          "纵轴对其方式：",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        Text("CrossAxisAlignment.start(顶对齐)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
            ],
          ),
        ),
        Text("CrossAxisAlignment.center(垂直居中)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
            ],
          ),
        ),
        Text("CrossAxisAlignment.end(底对齐)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
            ],
          ),
        ),
        Text("CrossAxisAlignment.stretch(伸展)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
            ],
          ),
        ),
        Text("CrossAxisAlignment.baseline(文本基线对齐)"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Container(
                width: 100,
                height: 30,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 25,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
            ],
          ),
        ),

        Text(
          "主轴尺寸按内容尺寸,可通过容器控制子元素对齐方式：MainAxisSize.min",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        Text("Alignment.topLeft"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
            ],
          ),
        ),
        Text("Alignment.topCenter"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
            ],
          ),
        ),
        Text("Alignment.topRight"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.topRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
            ],
          ),
        ),

        Text("Alignment.centerLeft"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
            ],
          ),
        ),
        Text("Alignment.center"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
            ],
          ),
        ),
        Text("Alignment.centerRight"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
            ],
          ),
        ),

        Text("Alignment.bottomLeft"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
            ],
          ),
        ),
        Text("Alignment.bottomCenter"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
            ],
          ),
        ),
        Text("Alignment.bottomRight"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
            ],
          ),
        ),

        Text(
          "文字方向",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        Text("textDirection.ltr"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box3"),
              ),
            ],
          ),
        ),

        Text("textDirection.rtl"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box3"),
              ),
            ],
          ),
        ),


        Text(
          "垂直方向",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        Text("CrossAxisAlignment.start VerticalDirection.up"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Container(
                width: 100,
                height: 30,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 20,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 25,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box3"),
              ),
            ],
          ),
        ),
        Text("CrossAxisAlignment.start VerticalDirection.down"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Container(
                width: 100,
                height: 30,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 20,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 25,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box3"),
              ),
            ],
          ),
        ),
        Text("CrossAxisAlignment.end VerticalDirection.up"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Container(
                width: 100,
                height: 30,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 20,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 25,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box3"),
              ),
            ],
          ),
        ),
        Text("CrossAxisAlignment.end VerticalDirection.down"),
        Container(
          color: Colors.black26,
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Container(
                width: 100,
                height: 30,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box1"),
              ),
              Container(
                width: 100,
                height: 20,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box2"),
              ),
              Container(
                width: 100,
                height: 25,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("box3"),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
