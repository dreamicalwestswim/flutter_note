import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationExample2 extends StatefulWidget {
  final String title;

  const AnimationExample2({Key? key, required this.title}) : super(key: key);

  @override
  State<AnimationExample2> createState() => _AnimationExample2State();
}

class _AnimationExample2State extends State<AnimationExample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>PageB(),
            ));
          },child: Text("自动识别平台切换效果"),),
          ElevatedButton(onPressed: () {
            Navigator.push(context, CupertinoPageRoute(
              builder: (context)=>PageB(),
            ));
          },child: Text("ios风格"),),

          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                pageBuilder: (BuildContext context, Animation<double> animation, Animation secondaryAnimation) {
                  return FadeTransition(
                    //使用渐隐渐入过渡,
                    opacity: animation,
                    child: PageB(), //路由B
                  );
                },
              ),
            );
          },child: Text("PageRouteBuilder实现渐隐渐入切换"),),

          ElevatedButton(onPressed: () {
            Navigator.push(context, FadeRoute(builder: (context) {
              return PageB();
            }));
          },child: Text("封装路由类实现"),),
        ],
      ),
    );
  }
}


class PageB extends StatefulWidget {

  const PageB({Key? key}) : super(key: key);

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title")),
      body: Column(
        children: [
          Text("123")
        ],
      ),
    );
  }
}


class FadeRoute extends PageRoute {
  FadeRoute({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //当前路由被激活，是打开新路由
    if(isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    }else{
      //是返回，则不应用过渡动画
      return Padding(padding: EdgeInsets.zero);
    }
  }
  // @override
  // Widget buildTransitions(BuildContext context, Animation<double> animation,
  //     Animation<double> secondaryAnimation, Widget child) {
  //   return FadeTransition(
  //     opacity: animation,
  //     child: builder(context),
  //   );
  // }
}