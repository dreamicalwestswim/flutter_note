import 'package:flutter/material.dart';


/// const NestedScrollView({
/// required this.headerSliverBuilder, header，sliver构造器
/// required this.body, 可以接受任意的可滚动组件
/// this.floatHeaderSlivers = false,
/// })

/// const SliverAppBar({
/// this.collapsedHeight, // 收缩起来的高度
/// this.expandedHeight,// 展开时的高度
/// this.pinned = false, // 是否固定
/// this.floating = false, //是否漂浮
/// this.snap = false, // 当漂浮时，此参数才有效
/// bool forceElevated //导航栏下面是否一直显示阴影
/// ...
/// })

class NestedScrollViewExample2 extends StatefulWidget {
  final String title;

  const NestedScrollViewExample2({Key? key, required this.title})
      : super(key: key);

  @override
  State<NestedScrollViewExample2> createState() =>
      _NestedScrollViewExampleState();
}

class _NestedScrollViewExampleState extends State<NestedScrollViewExample2> {
  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(title: Text('$index'));
        },
        childCount: count,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // 返回一个 Sliver 数组给外部可滚动组件。
          return <Widget>[
            SliverAppBar(
              title: Text(widget.title),
              pinned: true, // 固定在顶部
              forceElevated: innerBoxIsScrolled,
            ),
            buildSliverList(5), //构建一个 sliverList
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          physics: const ClampingScrollPhysics(), //重要
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(child: Text('Item $index')),
            );
          },
        ),
      ),
    );
  }
}
