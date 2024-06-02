import 'package:flutter/material.dart';

/// CustomScrollView 的主要功能是提供一个公共的的 Scrollable 和 Viewport，来组合多个 Sliver
/// CustomScrollView({
/// Key? key,
/// Axis scrollDirection = Axis.vertical,
/// bool reverse = false,
/// ScrollController? controller,
/// bool? primary,
/// ScrollPhysics? physics,
/// ScrollBehavior? scrollBehavior,
/// bool shrinkWrap = false,
/// Key? center,
/// double anchor = 0.0,
/// double? cacheExtent,
/// List  slivers = const  [], slivers类型的子列表
/// int? semanticChildCount,
/// DragStartBehavior dragStartBehavior = DragStartBehavior.start,
/// ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
/// String? restorationId,
/// Clip clipBehavior = Clip.hardEdge,
/// })

class CustomScrollViewExample extends StatefulWidget {
  final String title;

  const CustomScrollViewExample({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomScrollViewExample> createState() => _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {

  Widget buildTwoSliverList() {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    var listView = SliverFixedExtentList(
      itemExtent: 56, //列表项高度固定
      delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text('$index')),
        childCount: 20,
      ),
    );
    // 使用
    return CustomScrollView(
      slivers: [
        listView,
        listView,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildTwoSliverList(),
    );
  }
}
