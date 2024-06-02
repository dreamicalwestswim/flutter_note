import 'package:flutter/material.dart';

class NamedRouteExample extends StatefulWidget {
  const NamedRouteExample({super.key});

  @override
  State<NamedRouteExample> createState() => _NamedRouteExampleState();
}

class _NamedRouteExampleState extends State<NamedRouteExample> {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    RouteSettings routeSettings = ModalRoute.of(context)!.settings;
    String name = routeSettings.name!;
    Object args = routeSettings.arguments!;
    debugPrint(name);
    debugPrint(args.toString());
    return Scaffold(
      appBar: AppBar(title: Text('命名路由')),
      body: Center(
        child: Column(
          children: [
            Text('路由名称='+name),
            Text('路由参数='+args.toString())
          ],
        ),
      ),
    );
  }
}
