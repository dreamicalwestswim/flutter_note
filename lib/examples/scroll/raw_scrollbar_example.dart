import 'package:flutter/material.dart';

/// RawScrollbar({
/// Key? key,
/// required Widget child, 子元素
/// ScrollController? controller, 滚动控制器
/// bool? thumbVisibility, 停止滚动滚动条是否隐藏，默认隐藏，为true时不隐藏。
/// OutlinedBorder? shape, 滚动条现状(不能与radius一起使用)
/// Radius? radius, 滚动条圆角半径
/// double? thickness, 滚动条厚度
/// Color? thumbColor, 滚动条颜色
/// double minThumbLength = _kMinThumbExtent, 滚动条最小长度
/// double? minOverscrollLength,
/// bool? trackVisibility, 滚动轨迹是否可见，默认隐藏，为true时可见
/// Radius? trackRadius, 轨迹半径
/// Color? trackColor, 轨迹颜色 (无效果)
/// Color? trackBorderColor, 轨迹边框颜色 (无效果)
/// Duration fadeDuration = _kScrollbarFadeDuration,
/// Duration timeToFade = _kScrollbarTimeToFade,
/// Duration pressDuration = Duration.zero, 按压持续时间
/// bool Function(ScrollNotification) notificationPredicate = defaultScrollNotificationPredicate, 滚动触发(滚动信息)
/// bool? interactive,
/// ScrollbarOrientation? scrollbarOrientation, 滚动条的方向 纵向left/right 横向top/bottom。
/// double mainAxisMargin = 0.0, 主轴边界
/// double crossAxisMargin = 0.0, 纵轴边界
/// })

class RawScrollbarExample extends StatefulWidget {
  final String title;

  const RawScrollbarExample({Key? key, required this.title}) : super(key: key);

  @override
  State<RawScrollbarExample> createState() => _RawScrollbarExampleState();
}

class _RawScrollbarExampleState extends State<RawScrollbarExample> {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 显示进度条
      body: RawScrollbar(
        // 滚动条颜色
        thumbColor: Colors.blue,
        // 轨迹半径
        trackRadius: Radius.circular(50),
        // 主轴边界
        mainAxisMargin: 10,
        // 纵轴边界
        crossAxisMargin: 10,
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
          // // 滚动方向
          print('滚动方向');
          print(notification.metrics.axisDirection);
          // 最小滚动范围
          print('最小滚动范围');
          print(notification.metrics.minScrollExtent);
          // // 最大滚动范围
          print('最大滚动范围');
          print(notification.metrics.maxScrollExtent);
          // // 当前滚动量像素
          print('当前滚动量像素');
          print(notification.metrics.pixels);
          // // 滚动适口的尺寸
          print('滚动适口的尺寸');
          print(notification.metrics.viewportDimension);
          // 内容总尺寸
          print('内容总尺寸');
          print(notification.metrics.extentTotal);
          // 前面滚动的量
          print('前面滚动的量');
          print(notification.metrics.extentBefore);
          // 中间的量
          print('中间的量');
          print(notification.metrics.extentInside);
          // 后面未滚动的量
          print('后面未滚动的量');
          print(notification.metrics.extentAfter);
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
    );
  }
}
