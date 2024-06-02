import 'dart:developer';

import 'package:flutter/material.dart';

class GetStateExample extends StatefulWidget {
  final String title;

  const GetStateExample({super.key, required this.title});

  @override
  State<GetStateExample> createState() => _StateExampleState();
}

class _StateExampleState extends State<GetStateExample> {

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(title: Text(widget.title), leading: BackButton(),),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text('通过context.findAncestorStateOfType获取,'),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  /// 该方法可以从当前节点沿着 widget 树向上查找最近的指定类型的 StatefulWidget 对应的 State 对象
                  ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>()!;
                  // 打开抽屉菜单
                  _state.openDrawer();
                },
                child: Text('打开抽屉菜单1'),
              );
            }),

            Text('通过context.findRootAncestorStateOfType获取'),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  /// 该方法可以从根节点沿着 widget 树向下查找最近的指定类型的 StatefulWidget 对应的 State 对象
                  ScaffoldState _state = context.findRootAncestorStateOfType<ScaffoldState>()!;
                  // 打开抽屉菜单
                  _state.openDrawer();
                },
                child: Text('打开抽屉菜单1'),
              );
            }),

            Text('Scaffold.of，直接通过of静态方法来获取ScaffoldState'),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  /// 直接通过of静态方法来获取ScaffoldState
                  /// of内部也是通过context.findAncestorStateOfType<ScaffoldState>();去实现的，相当于约定俗成的一种暴露获取State的方式
                  ScaffoldState _state=Scaffold.of(context);
                  // 打开抽屉菜单
                  _state.openDrawer();
                },
                child: Text('打开抽屉菜单2'),
              );
            }),

            Text('通过GlobalKey获取'),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  _globalKey.currentState?.openDrawer();
                },
                child: Text('打开抽屉菜单3'),
              );
            }),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}