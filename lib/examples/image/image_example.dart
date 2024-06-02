import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageExample extends StatefulWidget {
  final String title;

  const ImageExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ImageExample> createState() => _ImageExampleState();
}


class _ImageExampleState extends State<ImageExample> {
  Uint8List? bytes;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/images/guy.png').then((data){
      setState((){
        bytes = data.buffer.asUint8List();
      });
    });
  }

  getMemoryImage(){
    return bytes != null ? Image(
      image: MemoryImage(bytes!),
      alignment: Alignment.topLeft,
      height: 48,
    ) : Text('加载中...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          const Text('''
读取图片的方式：
AssetImage(‘assets/lake.jpg’) assets的图片
Image.asset(name)

NetworkImage(‘http://.jpg’) 网络图片
Image.network(src)

FileImage(File(’/Users/lake.jpg’)) 文件图片
Image.file(file)

MemoryImage 内存图片
Image.memory(bytes)
          '''),
          const Text(
            '''
          Image({   
           Key? key,   
           required ImageProvider  image,   图片数据源的加载器
           Widget Function(BuildContext, Widget, int?, bool)? frameBuilder,  图片显示处理器
           Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder,   图片加载处理器
           Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,  图片错误处理器
           String? semanticLabel,   图片的描述
           bool excludeFromSemantics = false,   是否从语义上排除该图片，默认值为false
           double? width,   图片的宽度
           double? height,   图片的高度
           Color? color,   图片的前景色
           Animation ? opacity,   透明度
           BlendMode? colorBlendMode,   混合模式
           BoxFit? fit,   缩放模式
           AlignmentGeometry alignment = Alignment.center,   对齐方式
           ImageRepeat repeat = ImageRepeat.noRepeat,   重复方式
           Rect? centerSlice,  
           bool matchTextDirection = false,   是否在[TextDirection]方向上绘制图像。
           bool gaplessPlayback = false,   当ImageProvider改变时，设为true则继续显示旧图像
           bool isAntiAlias = false,   
           FilterQuality filterQuality = FilterQuality.low, 滤镜质量
           })
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),

          Text("从本地asset中加载图片"),
          Text('''
          Image(
            image: AssetImage("assets/images/guy.png"),
            alignment: Alignment.topLeft,
            height: 48,
          )
          '''),
          Image(
            image: AssetImage("assets/images/guy.png"),
            alignment: Alignment.topLeft,
            height: 48,
          ),
          Text('''
          Image.asset(
            "assets/images/guy.png",
            alignment: Alignment.topLeft,
            height: 48,
          )
          '''),
          Image.asset(
            "assets/images/guy.png",
            alignment: Alignment.topLeft,
            height: 48,
          ),


          Text("从网络加载图片"),
          Text('''
          Image(
            image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
            alignment: Alignment.topLeft,
            height: 48,
          )
          '''),
          Image(
            image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
            alignment: Alignment.topLeft,
            height: 48,
          ),
          Text('''
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            alignment: Alignment.topLeft,
            height: 48,
          )
          '''),
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            alignment: Alignment.topLeft,
            height: 48,
          ),

          Text("从内存中读取图片"),
          Text('''
          Image(
            image: MemoryImage(bytes!),
            alignment: Alignment.topLeft,
            height: 48,
          )
          '''),
          getMemoryImage(),
          Text("从硬盘中读取图片"),
          Text('''
          Image.file(
              File('/Users/jieguo/Documents/project/flutter/flutter_example/assets/images/guy.png'),
            alignment: Alignment.topLeft,
            height: 48,
          ),
          '''),
          Image.file(
              File('/Users/jieguo/Documents/project/flutter/flutter_example/assets/images/guy.png'),
            alignment: Alignment.topLeft,
            height: 48,
          ),
          Text('''
          Image(
            image: FileImage(File('/Users/jieguo/Documents/project/flutter/flutter_example/assets/images/guy.png')),
            alignment: Alignment.topLeft,
            height: 48,
          )
          '''),
          Image(
            image: FileImage(File('/Users/jieguo/Documents/project/flutter/flutter_example/assets/images/guy.png')),
            alignment: Alignment.topLeft,
            height: 48,
          ),
        ]));
  }
}