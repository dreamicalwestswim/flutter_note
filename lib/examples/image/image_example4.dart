import 'package:flutter/material.dart';

class ImageExample4 extends StatefulWidget {
  final String title;

  const ImageExample4({Key? key, required this.title}) : super(key: key);

  @override
  State<ImageExample4> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample4> {
  @override
  Widget build(BuildContext context) {
    var img=AssetImage('assets/images/guy.png');

    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("适配模式"),
          Text('''
fill, 拉伸填充满显示空间，图片会变形。
contain, 默认适应规则, 最大的边等比例填满显示空间
cover, 最小的边等比例填满显示空间，超出显示空间部分会被剪裁。
fitWidth, 设置宽度高度自适应，超出显示空间部分会被剪裁。
fitHeight, 设置高度宽度自适应，超出显示空间部分会被剪裁。
scaleDown, 图片大于显示空间，则采用与contain一致的缩放模式，否则采用none缩放模式
none, 图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
          '''),
          UnconstrainedBox(
            child: Column(
              children: <Image>[
                Image(
                  image: img,
                  height: 50.0,
                  width: 100.0,
                  fit: BoxFit.fill,
                ),
                Image(
                  image: img,
                  height: 50,
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  fit: BoxFit.fitWidth,
                ),
                Image(
                  image: img,
                  height: 100.0,
                  fit: BoxFit.fitHeight,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  height: 50.0,
                  fit: BoxFit.scaleDown,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.none,
                ),
              ].map((e){
                return Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 100,
                        child: e,
                      ),
                    ),
                    Text(e.fit.toString())
                  ],
                );
              }).toList(),
            ),
          ),
        ]));
  }
}
