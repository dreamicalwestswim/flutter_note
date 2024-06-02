import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageExample2 extends StatefulWidget {
  final String title;

  const ImageExample2({Key? key, required this.title}) : super(key: key);

  @override
  State<ImageExample2> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("frameBuilder"),
          Text(
              "可使用该属性在图片显示时添加动画，如下是一个图片淡入显示效果。当该属性与loadingBuilder属性同时存在时，该属性的result会作为child传入loadingBuilder中"),
          Image(
            image: NetworkImage(
                'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              // 第一次加载不会是true，已经加载完毕后面再加载就是true
              if (wasSynchronouslyLoaded) {
                return child;
              }
              return AnimatedOpacity(
                child: child,
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 4),
                curve: Curves.easeOut,
              );
            },
          ),
          Text("loadingBuilder"),
          Text("可通过该属性在图片加载时显示一个widget，例如下面是一个图片加载过程中显示一个加载进度的示例："),
          Image(
            image: NetworkImage('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                ),
              );
            },
          ),

          Text("errorBuilder"),
          Text("可通过该属性在图片加载失败时显示一个widget"),
          Image(
            image: NetworkImage('https://avatars2.githubusercontent.com'),
            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
              print(context);
              print(error);
              print(stackTrace);
              return Text('图片加载失败');
            },
          ),
        ]));
  }
}
