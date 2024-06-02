import 'package:flutter/material.dart';

class ImageExample5 extends StatefulWidget {
  final String title;

  const ImageExample5({Key? key, required this.title}) : super(key: key);

  @override
  State<ImageExample5> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample5> {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage('assets/images/guy.png');

    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("混合模式"),
          Text('''
  clear,
  src,
  dst,
  srcOver,
  dstOver,
  srcIn,
  dstIn,
  srcOut,
  dstOut,
  srcATop,
  dstATop,
  xor,
  plus,
  modulate,
  screen,  
  overlay,
  darken,
  lighten,
  colorDodge,
  colorBurn,
  hardLight,
  softLight,
  difference,
  exclusion,
  multiply,  
  hue,
  saturation,
  color,
  luminosity,
          '''),
          UnconstrainedBox(
            child: Column(
              children: <Image>[
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.color,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.colorBurn,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.colorDodge,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.darken,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.difference,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.dst,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.dstATop,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.dstIn,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.dstOut,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.dstOver,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.exclusion,
                ),

                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.hardLight,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.hue,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.lighten,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.luminosity,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.modulate,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.multiply,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.overlay,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.plus,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.saturation,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.screen,
                ),

                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.src,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.softLight,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.srcATop,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.srcIn,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.srcOut,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.srcOver,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.clear,
                ),
              ].map((e) {
                return Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 100,
                        child: e,
                      ),
                    ),
                    Text(e.colorBlendMode.toString())
                  ],
                );
              }).toList(),
            ),
          ),
        ]));
  }
}
