import 'package:flutter/material.dart';

class FontExample extends StatelessWidget {
  final String title;

  const FontExample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5e5e5),
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Text(
              "Flutter 中使用字体分两步完成。首先在pubspec.yaml中声明它们，以确保它们会打包到应用程序中。然后通过TextStyle属性使用字体。"),
          Text(
            '1. 在asset中声明',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
          Text('要将字体文件打包到应用中，和使用其它资源一样，要先在pubspec.yaml中声明它。然后将字体文件复制到在pubspec.yaml中指定的位置，如：'),
          Text('''
          flutter:
  fonts:
    - family: Raleway
      fonts:
        - asset: assets/fonts/Raleway-Regular.ttf
        - asset: assets/fonts/Raleway-Medium.ttf
          weight: 500
        - asset: assets/fonts/Raleway-SemiBold.ttf
          weight: 600
    - family: AbrilFatface
      fonts:
        - asset: assets/fonts/abrilfatface/AbrilFatface-Regular.ttf
          '''),

          Text(
            '2. 使用字体',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontFamily: 'Sansation_Light',
            ),
          ),
          Text('''
          // 声明文本样式
const textStyle = const TextStyle(
  fontFamily: 'Raleway',
);

// 使用文本样式
var buttonText = const Text(
  "Use the font for this text",
  style: textStyle,
);
          ''',
            style: TextStyle(
              fontFamily: 'Sansation_Light',
            ),
          ),
        ],
      ),
    );
  }
}
