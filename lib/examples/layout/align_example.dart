import 'package:flutter/material.dart';

/// 允许子组件绝对定位
/// Align({
/// Key? key,
/// AlignmentGeometry alignment = Alignment.center, 定位的位置
/// double? widthFactor, 宽度因子(子元素百分比)
/// double? heightFactor, 高度因子(子元素百分比)
/// Widget? child, 子元素
/// })

class AlignExample extends StatefulWidget {
  final String title;

  const AlignExample({Key? key, required this.title}) : super(key: key);

  @override
  State<AlignExample> createState() => _AlignExampleState();
}

class _AlignExampleState extends State<AlignExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "相对父级中心点定位",
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                Text("Alignment.topLeft = Alignment(-1.0, -1.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue.shade50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("Alignment.topCenter = Alignment(0.0, -1.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue.shade50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("Alignment.topRight = Alignment(1.0, -1.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue.shade50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("Alignment.centerLeft = Alignment(-1.0, 0.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue.shade50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("Alignment.center = Alignment(0.0, 0.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue.shade50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("Alignment.centerRight = Alignment(1.0, 0.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue.shade50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("Alignment.bottomLeft = Alignment(-1.0, 1.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue.shade50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("Alignment.bottomCenter = Alignment(0.0, 1.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue.shade50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("Alignment.bottomRight = Alignment(1.0, 1.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue.shade50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text(
                  "相对父级左上角定位",
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                Text("FractionalOffset.topLeft = FractionalOffset(0.0, 0.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: FractionalOffset.topLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("FractionalOffset.topCenter = FractionalOffset(0.5, 0.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: FractionalOffset.topCenter,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("FractionalOffset.topRight = FractionalOffset(1.0, 0.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: FractionalOffset.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text(
                    "FractionalOffset.centerLeft = FractionalOffset(0.0, 0.5)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: FractionalOffset.centerLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text("FractionalOffset.center = FractionalOffset(0.5, 0.5)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: FractionalOffset.center,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text(
                    "FractionalOffset.centerRight = FractionalOffset(1.0, 0.5)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: FractionalOffset.centerRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text(
                    "FractionalOffset.bottomLeft = FractionalOffset(0.0, 1.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: FractionalOffset.bottomLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text(
                    "FractionalOffset.bottomCenter = FractionalOffset(0.5, 1.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Text(
                    "FractionalOffset.bottomRight = FractionalOffset(1.0, 1.0)"),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),

                Text(
                  "设置宽高因子",
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                Text("widthFactor: 3， heightFactor: 3"),
                Container(
                  color: Colors.blue.shade50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    widthFactor: 3,
                    heightFactor: 3,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
