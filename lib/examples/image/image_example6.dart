import 'package:flutter/material.dart';

class ImageExample6 extends StatefulWidget {
  final String title;

  const ImageExample6({Key? key, required this.title}) : super(key: key);

  @override
  State<ImageExample6> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample6> {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage('assets/images/guy.png');

    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("ImageRepeat"),
          Text('''
  repeat, xy平铺
  repeatX, x平铺
  repeatY, y平铺
  noRepeat, 不平铺
          '''),
          UnconstrainedBox(
            child: Column(
              children: <Image>[
                Image(
                  image: img,
                  width: 100.0,
                  height: 200.0,
                  repeat: ImageRepeat.repeatX,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  height: 200.0,
                  repeat: ImageRepeat.repeatY ,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  height: 200.0,
                  repeat: ImageRepeat.repeat ,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  height: 200.0,
                  repeat: ImageRepeat.noRepeat ,
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
                    Text(e.repeat.toString())
                  ],
                );
              }).toList(),
            ),
          ),
        ]));
  }
}
