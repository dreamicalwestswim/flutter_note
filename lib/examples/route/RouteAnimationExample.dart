

import 'package:flutter/material.dart';

import 'FadeRoute.dart';

class RouteAnimationExample extends StatelessWidget {
  final String title;

  const RouteAnimationExample({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text('PageRouteBuilder 实现渐隐渐入过渡动画'),
              onPressed: () async {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    //动画时间为500毫秒
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                      return FadeTransition(
                        //使用渐隐渐入过渡,
                        opacity: animation,
                        child: TipRoute(),
                      );
                    },
                  ),
                );
              },
            ),

            TextButton(
              child: Text('MaterialPageRoute、CupertinoPageRoute，PageRouteBuilder，它们都继承自PageRoute类\n 也可以自定义一个类继承PageRoute实现自定义路由动画'),
              onPressed: () async {
                Navigator.push(context, FadeRoute(builder: (context) {
                  return TipRoute();
                }));
              },
            ),

          ],
        ),
      ),
    );
  }
}


class TipRoute extends StatelessWidget {
  TipRoute({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
