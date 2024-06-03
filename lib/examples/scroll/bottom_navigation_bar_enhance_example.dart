import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation_bar_enhance.dart';
import '../../widgets/keep_alive_wrapper.dart';

class BottomNavigationBarEnhanceExample extends StatefulWidget {
  final String title;

  const BottomNavigationBarEnhanceExample({Key? key, required this.title}) : super(key: key);

  @override
  State<BottomNavigationBarEnhanceExample> createState() => _SwitchTabPageState();
}

class _SwitchTabPageState extends State<BottomNavigationBarEnhanceExample> {
  int _index = 0;
  late PageController _pageController;
  final List<Widget> _pageItems = [];

  final List<BottomNavigationBarEnhanceItem> _tabBarItems = [
    BottomNavigationBarEnhanceItem(
        icon: 'assets/images/home.png',
        selectedIcon: 'assets/images/home_selected.png',
        label: "首页"
    ),
    BottomNavigationBarEnhanceItem(
      icon: 'assets/images/order.png',
      selectedIcon: 'assets/images/order_selected.png',
      label: "订单",
      isBadgeVisible: true,
      badgeLabel: "10",
    ),
    BottomNavigationBarEnhanceItem(
        icon: 'assets/images/my.png',
        selectedIcon: 'assets/images/my_selected.png',
        label: "我的"
    ),
    BottomNavigationBarEnhanceItem(
      icon: 'assets/images/my.png',
      selectedIcon: 'assets/images/my_selected.png',
      label: "我的2",
      isBadgeVisible: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; ++i) {
      //只需要用 KeepAliveWrapper 包装一下即可
      _pageItems.add(KeepAliveWrapper(child: Page(text: '$i')));
    }

    _pageController = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: PageView(
          controller: _pageController,
          // physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              _index = index;
            });
          },
          children: _pageItems,
        ),
        floatingActionButton: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.blue,
          ),
          child: FloatingActionButton(
            onPressed: () {},
            tooltip: '发布',
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBarEnhance(
          color: const Color(0xffcccccc),
          selectedColor: const Color(0xff000000),
          currentIndex: _index,
          emptyIndex: 2,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
            _pageController.jumpToPage(index);
          },
          items: _tabBarItems,
        ));
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
