import 'package:flutter/material.dart';

import '../../widgets/keep_alive_wrapper.dart';


/// BottomNavigationBar({
/// Key? key,
/// required List  items, 子列表项
/// void Function(int)? onTap, 点击
/// int currentIndex = 0, 当前选中索引
/// double? elevation, 投影大小
/// BottomNavigationBarType? type, 导航类型
/// Color? fixedColor, 固定颜色
/// Color? backgroundColor, 背景颜色
/// double iconSize = 24.0, icon大小
/// Color? selectedItemColor, 选中的颜色
/// Color? unselectedItemColor, 未选中的颜色
/// IconThemeData? selectedIconTheme, 选中icon的主题
/// IconThemeData? unselectedIconTheme, 未选中icon的主题
/// double selectedFontSize = 14.0, 选中的字号
/// double unselectedFontSize = 12.0, 未选中的字号
/// TextStyle? selectedLabelStyle, 选中的文字样式
/// TextStyle? unselectedLabelStyle, 未选中的文字样式
/// bool? showSelectedLabels, 显示选定标签
/// bool? showUnselectedLabels, 显示未选定标签
/// MouseCursor? mouseCursor, 鼠标样式
/// bool? enableFeedback, 启用反馈
/// BottomNavigationBarLandscapeLayout? landscapeLayout, // 布局方式
/// })

/// BottomNavigationBarItem({
/// required Widget icon, 图标
/// String? label, 文字
/// Widget? activeIcon, 选中图标
/// Color? backgroundColor, 背景颜色
/// String? tooltip, 长按提示
/// })
///
class BottomNavigationBarExample extends StatefulWidget {
  final String title;

  const BottomNavigationBarExample({Key? key, required this.title})
      : super(key: key);

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _index = 0;
  late PageController _pageController;
  final List<Widget> _pageList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; ++i) {
      //只需要用 KeepAliveWrapper 包装一下即可
      _pageList.add(KeepAliveWrapper(child: Page(text: '$i')));
    }
    _pageController = PageController(initialPage: _index);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _pageController,
        children: _pageList,
        onPageChanged: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 当前索引
        currentIndex: _index,
        // 点击修改索引值
        onTap: (int index) {
          setState(() {
            _index = index;
          });
          _pageController.jumpToPage(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.greenAccent,
        items: const [
          BottomNavigationBarItem(
              icon: Image(image: AssetImage('assets/images/home.png'), width: 30,),
              activeIcon: Image(image: AssetImage('assets/images/home_selected.png'), width: 30,),
              label: "首页"
          ),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage('assets/images/order.png'), width: 30,),
              activeIcon: Image(image: AssetImage('assets/images/order_selected.png'), width: 30,),
              label: "订单"
          ),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage('assets/images/my.png'), width: 30,),
              activeIcon: Image(image: AssetImage('assets/images/my_selected.png'), width: 30,),
              label: "我的"
          ),
        ],
      ),
    );
  }
}

// Tab 页面
class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(child: Text("${widget.text}", textScaleFactor: 5));
  }
}
