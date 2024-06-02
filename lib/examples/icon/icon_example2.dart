import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class IconExample2 extends StatefulWidget {
  final String title;

  const IconExample2({Key? key, required this.title}) : super(key: key);

  @override
  State<IconExample2> createState() => _IconExampleState();
}

class _IconExampleState extends State<IconExample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text(
            "iconfont.cn上有很多字体图标素材，可以选择自己需要的图标打包下载后，会生成一些不同格式的字体文件，在Flutter中，使用ttf格式即可。",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              '1. 导入字体图标文件；这一步和导入字体文件相同，假设我们的字体图标文件保存在项目根目录下，路径为"fonts/iconfont.ttf"：'),
          Text('''
          fonts:
          - family: myIcon  #指定一个字体名
          fonts:
          - asset: fonts/iconfont.ttf
          '''),
          Text("2. 为了使用方便，我们定义一个MyIcons类，功能和Icons类一样：将字体文件中的所有图标都定义成静态变量："),
          Text('''
class MyIcons{
  // book 图标
  static const IconData book = const IconData(
      0xe614, 
      fontFamily: 'myIcon', 
      matchTextDirection: true
  );
  // 微信图标
  static const IconData wechat = const IconData(
      0xec7d,  
      fontFamily: 'myIcon', 
      matchTextDirection: true
  );
}
          '''),
          Text("3. 使用"),
          Text('''
Icon(MyIcons.book,color: Colors.purple),
          '''),
          UnconstrainedBox(
            alignment: Alignment.topLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(MyIcons.mifeng),
              Icon(MyIcons.hujiachong,color: Colors.blue),
            ]),
          ),
        ]));
  }
}


class MyIcons{
  // 蜜蜂
  static const IconData mifeng = IconData(
      0xe86f,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );
  // 虎甲虫
  static const IconData hujiachong = IconData(
      0xe870,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );
}