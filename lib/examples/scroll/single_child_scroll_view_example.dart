import 'package:flutter/material.dart';

/// 滚动条(android ios 会自动切换默认样式)
/// Scrollbar({
/// Key? key,
/// required Widget child, 子元素
/// ScrollController? controller, 滚动控制器
/// bool? thumbVisibility, 停止滚动滚动条是否隐藏，默认隐藏，为true时不隐藏。
///  bool? trackVisibility, 滚动轨迹是否可见，默认隐藏，为true时可见
///  double? thickness, 滚动条厚度
///  Radius? radius, 滚动条圆角半径
///  bool Function(ScrollNotification)? notificationPredicate, 滚动触发(滚动信息)
///  bool? interactive, 不详
///  ScrollbarOrientation? scrollbarOrientation, 滚动条的方向 纵向left/right 横向top/bottom。
///  bool? isAlwaysShown, 此功能在v2.9.0-1.0.pre之后被弃用。
///  bool? showTrackOnHover, 此功能在v2.9.0-1.0之前被弃用。。
///  double? hoverThickness, 此功能在v2.9.0-1.0之后被弃用
///  })

/// 单个元素滚动
/// SingleChildScrollView({
/// Key? key,
/// Axis scrollDirection = Axis.vertical, 滚动方向 纵向/横向
///  bool reverse = false, 表示是否按照阅读方向相反的方向滑动
///  EdgeInsetsGeometry? padding, 内填充
///  bool? primary, //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
///  ScrollPhysics? physics, 滚动回弹 默认在 iOS 上会出现弹性效果，而在 Android 上会出现微光效果
///  ScrollController? controller, 滚动控制器
///  Widget? child, 子元素
///  DragStartBehavior dragStartBehavior = DragStartBehavior.start, 响应拖动的时机
///  Clip clipBehavior = Clip.hardEdge, 裁剪模式
///  String? restorationId, id
///  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, 滑动组件键盘隐藏模式
///  })

class SingleChildScrollViewExample extends StatefulWidget {
  final String title;

  const SingleChildScrollViewExample({Key? key, required this.title})
      : super(key: key);

  @override
  State<SingleChildScrollViewExample> createState() =>
      _SingleChildScrollViewExampleState();
}

class _SingleChildScrollViewExampleState
    extends State<SingleChildScrollViewExample> {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 显示进度条
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(title: Text("列表头部"),),
          Expanded(
            child: Scrollbar(
              // 滚动条不隐藏
              thumbVisibility: true,
              // 轨迹可见
              trackVisibility: true,
              // 滚动条厚度
              thickness: 10,
              // 滚动条圆角半径
              radius: Radius.circular(5),
              // 滚动触发
              notificationPredicate: (ScrollNotification notification) {
                // 最小滚动范围
                print(notification.metrics.minScrollExtent);
                // // 最大滚动范围
                print(notification.metrics.maxScrollExtent);
                // // 当前滚动量像素
                print(notification.metrics.pixels);
                // // 滚动适口的尺寸
                print(notification.metrics.viewportDimension);
                // // 滚动方向
                print(notification.metrics.axisDirection);
                // 返回true滚动条才会动
                return true;
              },
              // 滚动条的方向
              scrollbarOrientation: ScrollbarOrientation.left,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    //动态创建一个List<Widget>
                    children: str
                        .split("")
                        //每一个字母都用一个Text显示,字体为原来的两倍
                        .map((c) => Text(
                              c,
                              textScaleFactor: 2.0,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
