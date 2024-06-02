import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Scaffold({
///     Key? key,
///     this.appBar, 页面上方导航条
///     this.body, 页面主体容器
///     this.floatingActionButton, 漂浮动作按钮
///     this.floatingActionButtonLocation, 悬浮按钮位置
///     this.floatingActionButtonAnimator, 悬浮按钮动画
///     this.persistentFooterButtons, 显示在底部导航条上方的一组按钮
///     this.drawer, 左侧菜单
///     this.onDrawerChanged, 左侧菜单变化回调
///     this.endDrawer, 右侧菜单
///     this.onEndDrawerChanged, 右侧菜单变化回调
///     this.bottomNavigationBar, 底部导航条
///     this.bottomSheet, 一个持久停留在body下方，底部控件上方的控件
///     this.backgroundColor, 背景色
///     this.resizeToAvoidBottomInset, 默认为 true，防止一些小组件重复
///     this.primary = true, 是否在屏幕顶部显示Appbar, 默认为 true，Appbar 是否向上延伸到状态栏，如电池电量，时间那一栏
///     this.drawerDragStartBehavior = DragStartBehavior.start, 控制 drawer 拖动的手势位置
///     this.extendBody = false, 	body 是否延伸到底部控件
///     this.extendBodyBehindAppBar = false, 默认 false，为 true 时，body 会置顶到 appbar 后，如appbar 为半透明色，可以有毛玻璃效果
///     this.drawerScrimColor, 侧滑栏拉出来时，用来遮盖主页面的颜色
///     this.drawerEdgeDragWidth, 侧滑栏拉出来的宽度
///     this.drawerEnableOpenDragGesture = true, 左侧侧滑栏是否可以滑动
///     this.endDrawerEnableOpenDragGesture = true, 右侧侧滑栏是否可以滑动
///     this.restorationId,
///   })

/// AppBar({
/// Key? key,
///  Widget? leading, 导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
///  bool automaticallyImplyLeading = true, 如果leading为null，是否自动实现默认的leading按钮
///  Widget? title, 页面标题
///  List ? actions, 导航栏右侧菜单
///  Widget? flexibleSpace, 此小部件堆叠在工具栏和选项卡栏的后面。
///  PreferredSizeWidget? bottom, 导航栏底部菜单，通常为Tab按钮组
///   double? elevation, 导航栏阴影
///   double? scrolledUnderElevation,
///   Color? shadowColor,
///   Color? surfaceTintColor,
///   ShapeBorder? shape,
///   Color? backgroundColor,
///   Color? foregroundColor,
///   Brightness? brightness,
///   IconThemeData? iconTheme,
///   IconThemeData? actionsIconTheme,
///   TextTheme? textTheme,
///   bool primary = true,
///   bool? centerTitle, 标题是否居中
///   bool excludeHeaderSemantics = false,
///   double? titleSpacing,
///   double toolbarOpacity = 1.0,
///   double bottomOpacity = 1.0,
///   double? toolbarHeight,
///   double? leadingWidth,
///   bool? backwardsCompatibility,
///   TextStyle? toolbarTextStyle,
///   TextStyle? titleTextStyle,
///   SystemUiOverlayStyle? systemOverlayStyle,
///   })

class ScaffoldExample extends StatefulWidget {
  final String title;

  const ScaffoldExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ScaffoldExample> createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  late TabController _tabController; //需要定义一个Controller
  final List<Tab> tabs = <Tab>[
    Tab(text: '音乐', icon: Icon(Icons.music_note)),
    Tab(text: '体育', icon: Icon(Icons.directions_run)),
    Tab(text: '天气', icon: Icon(Icons.cloud_queue)),
    Tab(text: '科技', icon: Icon(Icons.toys))
  ];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);

    // 添加监听获取tab选中下标
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _tabController.index = index;
  }

  void _onAdd() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 导航栏最左侧Widget
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        // 导航标题
        title: Text(widget.title),
        // 导航栏右侧菜单
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
          IconButton(
              icon: Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.dashboard, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              }),
              onPressed: () {}),
        ],
        // 导航栏底层内容
        flexibleSpace: Container(
          height: 100,
          color: Colors.green,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 30,
              color: Colors.brown,
            ),
          ),
        ),
        // tab菜单
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
        // 标题居中
        centerTitle: true,
        // 背景色
        backgroundColor: Color.fromRGBO(255, 255, 255, .5),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return e;
        }).toList(),
      ),
      // 底部导航tabbar
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
        backgroundColor: Color.fromRGBO(255, 255, 255, .5),
      ),
      // 打洞效果
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
      //   child: Row(
      //     children: [
      //       IconButton(
      //         icon: Icon(Icons.home),
      //         onPressed: () {},
      //       ),
      //       SizedBox(), //中间位置空出
      //       IconButton(
      //         icon: Icon(Icons.business),
      //         onPressed: () {},
      //       ),
      //     ],
      //     mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
      //   ),
      // ),
      // 悬浮按钮
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: _onAdd),
      //抽屉
      drawer: new MyDrawer(),
      //抽屉
      endDrawer: new MyDrawer(),
      // 显示在底部导航条上方的一组按钮
      persistentFooterButtons: [
        ElevatedButton(onPressed: () {}, child: Text("button1")),
        ElevatedButton(onPressed: () {}, child: Text("button2"))
      ],
      // 一个持久停留在body下方，底部控件上方的控件
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return Container(
            height: 60,
            color: Colors.cyan,
            child: Text('Bottom Sheet'),
            alignment: Alignment.center,
          );
        },
      ),
      // 背景颜色
      backgroundColor: Colors.white54,
      // 控制 drawer 拖动的手势位置
      drawerDragStartBehavior: DragStartBehavior.down,
      // body 是否延伸到底部控件
      extendBody: true,
      // body 会置顶到 appbar 后
      extendBodyBehindAppBar: true,
    );
  }
}

class MyDrawer extends StatelessWidget {
  MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/guy.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
