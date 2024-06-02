import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// MaterialPageRoute 是 Material组件库提供的组件，它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画：
/// MaterialPageRoute({
/// required Widget Function(BuildContext) builder, 是一个WidgetBuilder类型的回调函数，它的作用是构建路由页面的具体内容，返回值是一个widget。我们通常要实现此回调，返回新路由的实例。
/// RouteSettings? settings, 包含路由的配置信息，如路由名称、是否初始路由（首页）。
/// bool maintainState = true, 默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为 false。
/// bool fullscreenDialog = false, 表示新的路由页面是否是一个全屏的模态对话框，在 iOS 中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）。
/// })

/// 对于 Android，当打开新页面时，新的页面会从屏幕底部滑动到屏幕顶部；当关闭页面时，当前页面会从屏幕顶部滑动到屏幕底部后消失，同时上一个页面会显示到屏幕上。
/// 对于 iOS，当打开页面时，新的页面会从屏幕右侧边缘一直滑动到屏幕左边，直到新页面全部显示到屏幕上，而上一个页面则会从当前屏幕滑动到屏幕左侧而消失；当关闭页面时，正好相反，
/// 当前页面会从屏幕右侧滑出，同时上一个页面会从屏幕左侧滑入。

class MaterialPageRouteExample extends StatelessWidget {
  final String title;

  const MaterialPageRouteExample({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("MaterialPageRoute, ios会从左到右边，android会从下到上弹出新页面"),
              onPressed: () {
                //导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return NewRoute();
                  }),
                );
              },
            ),

            TextButton(
              child: Text("CupertinoPageRoute ios风格"),
              onPressed: () {
                //导航到新路由
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    return NewRoute();
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}
