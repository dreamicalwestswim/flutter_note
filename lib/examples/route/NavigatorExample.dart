import 'package:flutter/material.dart';

/// Navigator是一个路由管理的组件，它提供了打开和退出路由页方法。Navigator通过一个栈来管理活动路由集合。通常当前屏幕显示的页面就是栈顶的路由。Navigator提供了一系列方法来管理路由栈


/// ---------------------路由进栈---------------------
/// Future push(BuildContext context, Route route)
/// 将给定的路由入栈（即打开新的页面），返回值是一个Future对象，用以接收新路由出栈（即关闭）时的返回数据。

/// Navigator.pushNamed(context, routeName)
/// 命名路由进栈

/// ---------------------路由出栈---------------------
/// bool pop(BuildContext context, [ result ])
/// 将栈顶路由出栈，result 为页面关闭时返回给上一个页面的数据。

/// Navigator.popUntil(context, ModalRoute.withName('/'));
/// 弹出到指定路由, 不设置指定路由则会将所有路由弹出，会反复执行pop直到该函数predicate返回true停止

/// Navigator.removeRoute(context, route)
/// 移除路由并摧毁

/// Navigator.maybePop(context)
/// 能推出则推出，首页不会推出

/// Navigator.removeRouteBelow(context, anchorRoute);
/// 从栈中移除指定路由并摧毁

/// ---------------------路由替换---------------------
/// Navigator.popAndPushNamed(context, '');
/// 当前页面出栈，命名路由进栈

/// Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
/// 新路由进栈，其他指定路由从栈中移除并摧毁

/// Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false)
/// 新命名路由进栈，其他指定路由从栈中移除并摧毁

/// Navigator.pushReplacement(context, newRoute)
/// 新路由替换当前路由

/// Navigator.pushReplacementNamed(context, routeName)
/// 新命名路由替换当前路由

/// Navigator.replace(context, oldRoute: oldRoute, newRoute: newRoute)
/// 指定新路由替换旧路由

/// Navigator.replaceRouteBelow(context, anchorRoute: anchorRoute, newRoute: newRoute)
/// 将指定路由替换成一个新的路由

/// ---------------------of获取上下文实例---------------------
/// Navigator.of(context)
/// 静态方法内部都是通过Navigator.of(context)来处理的所以两者是等价的。
/// Navigator.push(BuildContext context, Route route) 等价于 Navigator.of(context).push(Route route)

class NavigatorExample extends StatelessWidget {
  final String title;

  const NavigatorExample({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("Navigator.push"),
              onPressed: () {
                /// 路由可关闭(可以判断是否是栈的最底部，因为最最低不能关闭)
                /// print(Navigator.canPop(context));
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
              child: Text("Navigator.pop"),
              onPressed: () {
                // 关闭当前路由
                Navigator.pop(context);
              },
            ),

            TextButton(
              child: Text("Navigator.popUntil"),
              onPressed: () {
                // 弹出全部路由
                Navigator.popUntil(context, (route) => false);
              },
            ),

            TextButton(
              child: Text("Navigator.pushReplacement"),
              onPressed: () {
                // 新路由替换当前路由
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return NewRoute();
                  }),
                );
              },
            ),
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
