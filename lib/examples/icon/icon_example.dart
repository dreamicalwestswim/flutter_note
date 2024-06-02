import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class IconExample extends StatefulWidget {
  final String title;

  const IconExample({Key? key, required this.title}) : super(key: key);

  @override
  State<IconExample> createState() => _IconExampleState();
}

class _IconExampleState extends State<IconExample> {
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: 0xe03e
    icons += "\uE03e";
// error:  0xe237
    icons += " \uE237";
// fingerprint: 0xe287
    icons += " \uE287";

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text.rich(
            TextSpan(
              text: "Material Design：",
              children: [
                TextSpan(
                    text: "https://material.io/tools/icons/",
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {

                      })
              ],
            ),
          ),
          UnconstrainedBox(
            alignment: Alignment.topLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("使用字符码"),
                  Text(
                    icons,
                    style: TextStyle(
                      fontFamily: "MaterialIcons",
                      fontSize: 24.0,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    icons,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.green,
                    ),
                  ),


                  Text("使用Icon > IconData"),
                  Icon(Icons.accessible,color: Colors.green),
                  Icon(Icons.error,color: Colors.green),
                  Icon(Icons.fingerprint,color: Colors.green),
                ]),
          ),
        ]));
  }
}
