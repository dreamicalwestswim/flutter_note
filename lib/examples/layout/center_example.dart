import 'package:flutter/material.dart';

/// Center({
/// Key? key,
/// double? widthFactor, 宽度因子(子元素百分比)
/// double? heightFactor, 高度因子(子元素百分比)
/// Widget? child, 子元素
/// })

class CenterExample extends StatefulWidget {
  final String title;

  const CenterExample({Key? key, required this.title}) : super(key: key);

  @override
  State<CenterExample> createState() => _CenterExampleState();
}

class _CenterExampleState extends State<CenterExample> {
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
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(
                    child: Text("xxx"),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(
                    widthFactor: 2,
                    heightFactor: 2,
                    child: Text("xxx"),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
