import 'dart:math';

import 'package:flutter/material.dart';

/// FittedBox({
///     Key? key,
///     this.fit = BoxFit.contain, // 适配方式
///     this.alignment = Alignment.center, //对齐方式
///     this.clipBehavior = Clip.none, //是否剪裁
///     Widget? child,
///   })


class FittedBoxExample extends StatefulWidget {
  final String title;

  const FittedBoxExample({Key? key, required this.title}) : super(key: key);

  @override
  State<FittedBoxExample> createState() => _FittedBoxExampleState();
}

class _FittedBoxExampleState extends State<FittedBoxExample> {
  @override
  Widget build(BuildContext context) {

    Widget wContainer(BoxFit boxFit) {
      return  ClipRect( // 将超出子组件布局范围的绘制内容剪裁掉
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
          child: FittedBox(
            fit: boxFit,
            child: Container(width: 60, height: 70, color: Colors.blue),
          ),
        ),
      );
    }

    // 直接使用Row
    Widget wRow(String text) {
      Widget child = Text(text);
      child = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [child, child, child],
      );
      return child;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                wContainer(BoxFit.none),
                Text('Wendux'),
                wContainer(BoxFit.contain),
                Text('Flutter中国'),
              ],
            ),

            Column(
              children:  [
                wRow(' 90000000000000000 '),
                SingleLineFittedBox(child: wRow(' 90000000000000000 ')),
                wRow(' 800 '),
                SingleLineFittedBox(child: wRow(' 800 ')),
              ]
                  .map((e) => Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: e,
              ))
                  .toList(),
            )
          ],
        ));
  }
}

// 但行空间适配
class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key,this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minWidth: constraints.maxWidth,
              maxWidth: double.infinity,
              //maxWidth: constraints.maxWidth
            ),
            child: child,
          ),
        );
      },
    );
  }
}