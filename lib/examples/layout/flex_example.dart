import 'package:flutter/material.dart';

/// 弹性布局容器
/// Flex({
/// Key? key,
/// required Axis direction, 布局方向，Axis.horizontal = Row组件， Axis.vertical = Column组件。
/// MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, 主轴对齐方式
/// MainAxisSize mainAxisSize = MainAxisSize.max, 主轴尺寸
/// CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, 纵轴对其方式
/// TextDirection? textDirection, 文字方向
/// VerticalDirection verticalDirection = VerticalDirection.down, 垂直方向
/// TextBaseline? textBaseline,文本基线
/// Clip clipBehavior = Clip.none, 裁剪模式
/// List  children = const  [], 子元素
/// })

/// 按比例占据父级空间支持子元素
/// Expanded({
/// Key? key,
/// int flex = 1, 占据控制
/// required Widget child, 子元素
/// })

/// 按比例占据父级空间
/// Spacer({
/// Key? key,
/// this.flex = 1 占据空间
/// })


class FlexExample extends StatefulWidget {
  final String title;

  const FlexExample({Key? key, required this.title}) : super(key: key);

  @override
  State<FlexExample> createState() => _FlexExampleState();
}

class _FlexExampleState extends State<FlexExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            //Flex的两个子widget按1：2来占据水平空间
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 100.0,
                //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
