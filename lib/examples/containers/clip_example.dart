import 'dart:math';

import 'package:flutter/material.dart';

/// ClipOval	子组件为正方形时剪裁成内贴圆形；为矩形时，剪裁成内贴椭圆
/// ClipRRect	将子组件剪裁为圆角矩形
/// ClipRect	默认剪裁掉子组件布局空间之外的绘制内容（溢出部分剪裁）
/// ClipPath	按照自定义的路径剪裁

class ClipExample extends StatefulWidget {
  final String title;

  const ClipExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ClipExample> createState() => _ClipExampleState();
}

class _ClipExampleState extends State<ClipExample> {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("assets/images/guy.png");

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("不剪裁"),
                avatar, //不剪裁
                Text("ClipOval"),
                ClipOval(child: avatar), //剪裁为圆形
                Text("ClipRRect"),
                ClipRRect(
                  //剪裁为圆角矩形
                  borderRadius: BorderRadius.circular(10.0),
                  child: avatar,
                ),
                Text("不裁剪"),
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                      child: avatar,
                    ),
                    Text(
                      "你好世界",
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
                Text("ClipRect"),
                Row(
                  children: <Widget>[
                    ClipRect(
                      //将溢出部分剪裁
                      child: Align(
                        alignment: Alignment.topLeft,
                        widthFactor: .5, //宽度设为原来宽度一半
                        child: avatar,
                      ),
                    ),
                    Text("你好世界", style: TextStyle(color: Colors.green))
                  ],
                ),

                Text("自定义裁剪"),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: ClipRect(
                      clipper: MyClipper(), //使用自定义的clipper
                      child: avatar),
                ),

                Text("ClipPath"),
                ClipPath(
                    clipper: MyPathClipper(),
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.5,
                      child: Image.network(
                          "http://img.redocn.com/sheying/20150213/mulanweichangcaoyuanfengjing_3951976.jpg",
                          fit: BoxFit.fill),
                    )),

                Text("ClipPath.shape = CircleBorder()"),
                ClipPath.shape(
                    shape: CircleBorder(),
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.5,
                      child: Image.network(
                          "http://img.redocn.com/sheying/20150213/mulanweichangcaoyuanfengjing_3951976.jpg",
                          fit: BoxFit.fill),
                    )),
                Text("ClipPath.shape = RoundedRectangleBorder()"),
                ClipPath.shape(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.5,
                      child: Image.network(
                          "http://img.redocn.com/sheying/20150213/mulanweichangcaoyuanfengjing_3951976.jpg",
                          fit: BoxFit.fill),
                    )),

                Text("ClipPath.shape = UnderlineInputBorder()"),
                ClipPath.shape(
                    shape: UnderlineInputBorder(),
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.5,
                      child: Image.network(
                          "http://img.redocn.com/sheying/20150213/mulanweichangcaoyuanfengjing_3951976.jpg",
                          fit: BoxFit.fill),
                    )),
              ],
            ),
          ],
        ));
  }
}

class MyPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
