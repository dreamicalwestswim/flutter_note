import 'package:flutter/material.dart';

import '../../widgets/keep_alive_wrapper.dart';


/// TabBar({
/// Key? key,
/// required List  tabs, 列表项
/// TabController? controller, tab控制器
/// bool isScrollable = false,
/// EdgeInsetsGeometry? padding, 内填充
/// Color? indicatorColor, 指示器颜色(选中的下划线颜色)
/// bool automaticIndicatorColorAdjustment = true, 自动显示颜色调整
/// double indicatorWeight = 2.0, 指示器厚度
/// EdgeInsetsGeometry indicatorPadding = EdgeInsets.zero, 指示器填充
/// Decoration? indicator, 指示器装饰
/// TabBarIndicatorSize? indicatorSize, 指示器大小 label tab
/// Color? labelColor, 文字颜色
/// TextStyle? labelStyle, 文字样式
/// EdgeInsetsGeometry? labelPadding, 文字填充
/// Color? unselectedLabelColor, 未选中文字颜色
/// TextStyle? unselectedLabelStyle, 未选中文字样式
/// DragStartBehavior dragStartBehavior = DragStartBehavior.start,
/// MaterialStateProperty ? overlayColor, 划过颜色
/// MouseCursor? mouseCursor, 鼠标样式
/// bool? enableFeedback,
/// void Function(int)? onTap, 点击
/// ScrollPhysics? physics,
/// InteractiveInkFeatureFactory? splashFactory,
/// BorderRadius? splashBorderRadius, 边框半径
/// })

/// Tab({
/// Key? key,
/// String? text, 文字
/// Widget? icon, 图标
/// EdgeInsetsGeometry iconMargin = const EdgeInsets.only(bottom: 10.0), 图标边界
/// double? height, 高度
/// Widget? child, 子元素
/// })

/// TabBarView({
/// Key? key,
/// required List  children, 子元素列表
/// TabController? controller, 控制器
/// ScrollPhysics? physics,
/// DragStartBehavior dragStartBehavior = DragStartBehavior.start,
/// double viewportFraction = 1.0,
/// })

/// TabController({
/// int initialIndex = 0, 默认索引
/// Duration? animationDuration, 切换动画延迟时长
/// required int length, tab长度
/// required TickerProvider vsync,  SingleTickerProviderStateMixin混入模式
/// })

/// DefaultTabController({
/// Key? key,
/// required int length, tab长度
/// int initialIndex = 0, 默认索引
/// required Widget child, 子元素
/// Duration? animationDuration, 切换动画延迟时长
/// })

class TabBarViewExample extends StatefulWidget {
  final String title;

  const TabBarViewExample({Key? key, required this.title}) : super(key: key);

  @override
  State<TabBarViewExample> createState() => _TabBarViewExampleState();
}

class _TabBarViewExampleState extends State<TabBarViewExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.brown,
            height: 200,
            child: TabBarView(
              //构建
              controller: _tabController,
              children: tabs.map((e) {
                return KeepAliveWrapper(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(e, textScaleFactor: 5),
                  ),
                );
              }).toList(),
            ),
          ),
          Text("使用DefaultTabController"),
          DefaultTabController(
            animationDuration: Duration(seconds: 1),
            length: tabs.length,
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  child: TabBar(
                    indicatorColor: Colors.white,
                    tabs: tabs.map((e) => Tab(text: e)).toList(),
                  ),
                ),
                Container(
                  color: Colors.brown,
                  height: 200,
                  child: TabBarView(
                    children: tabs.map((e) {
                      return KeepAliveWrapper(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(e, textScaleFactor: 5),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
