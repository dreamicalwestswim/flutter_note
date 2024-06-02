import 'package:flutter/material.dart';

/// GridView({
/// Key? key,
/// Axis scrollDirection = Axis.vertical,
/// bool reverse = false,
/// ScrollController? controller,
/// bool? primary,
/// ScrollPhysics? physics,
/// bool shrinkWrap = false,
/// EdgeInsetsGeometry? padding,
/// required SliverGridDelegate gridDelegate, 子元素布局方式
/// bool addAutomaticKeepAlives = true,
/// bool addRepaintBoundaries = true,
/// bool addSemanticIndexes = true,
/// double? cacheExtent,
/// List  children = const  [],
/// int? semanticChildCount,
/// DragStartBehavior dragStartBehavior = DragStartBehavior.start,
/// Clip clipBehavior = Clip.hardEdge,
/// ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
/// String? restorationId,
/// })

/// 横轴为固定数量子元素的layout
/// SliverGridDelegateWithFixedCrossAxisCount({
/// required int crossAxisCount, 横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
/// double mainAxisSpacing = 0.0, 主轴方向的间距。
/// double crossAxisSpacing = 0.0, 横轴方向子元素的间距。
/// double childAspectRatio = 1.0, 子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
/// double? mainAxisExtent, 主轴范围
/// })

/// 横轴子元素为固定最大长度的layout
/// SliverGridDelegateWithMaxCrossAxisExtent({
/// required double maxCrossAxisExtent, 子元素在横轴上的最大长度
/// double mainAxisSpacing = 0.0, 主轴方向的间距。
/// double crossAxisSpacing = 0.0, 横轴方向子元素的间距。
/// double childAspectRatio = 1.0, 子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
/// double? mainAxisExtent, 主轴范围
/// })

/// GridView.count({
/// Key? key,
/// Axis scrollDirection = Axis.vertical,
/// bool reverse = false,
/// ScrollController? controller,
/// bool? primary,
/// ScrollPhysics? physics,
/// bool shrinkWrap = false,
/// EdgeInsetsGeometry? padding,
/// required int crossAxisCount,
/// double mainAxisSpacing = 0.0,
/// double crossAxisSpacing = 0.0,
/// double childAspectRatio = 1.0,
/// bool addAutomaticKeepAlives = true,
/// bool addRepaintBoundaries = true,
/// bool addSemanticIndexes = true,
/// double? cacheExtent,
/// List  children = const  [],
/// int? semanticChildCount,
/// DragStartBehavior dragStartBehavior = DragStartBehavior.start,
/// ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
/// String? restorationId,
/// Clip clipBehavior = Clip.hardEdge,
/// })

/// GridView.extent({
/// Key? key,
/// Axis scrollDirection = Axis.vertical,
/// bool reverse = false,
/// ScrollController? controller,
/// bool? primary,
/// ScrollPhysics? physics,
/// bool shrinkWrap = false,
/// EdgeInsetsGeometry? padding,
/// required double maxCrossAxisExtent,
/// double mainAxisSpacing = 0.0,
/// double crossAxisSpacing = 0.0,
/// double childAspectRatio = 1.0,
/// bool addAutomaticKeepAlives = true,
/// bool addRepaintBoundaries = true,
/// bool addSemanticIndexes = true,
/// double? cacheExtent,
/// List  children = const  [],
/// int? semanticChildCount,
/// DragStartBehavior dragStartBehavior = DragStartBehavior.start,
/// ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
/// String? restorationId,
/// Clip clipBehavior = Clip.hardEdge,
/// })

/// GridView.builder({
/// Key? key,
/// Axis scrollDirection = Axis.vertical,
/// bool reverse = false,
/// ScrollController? controller,
/// bool? primary,
/// ScrollPhysics? physics,
/// bool shrinkWrap = false,
/// EdgeInsetsGeometry? padding,
/// required SliverGridDelegate gridDelegate,
/// required Widget Function(BuildContext, int) itemBuilder,
/// int? Function(Key)? findChildIndexCallback,
/// int? itemCount,
/// bool addAutomaticKeepAlives = true,
/// bool addRepaintBoundaries = true,
/// bool addSemanticIndexes = true,
/// double? cacheExtent,
/// int? semanticChildCount,
/// DragStartBehavior dragStartBehavior = DragStartBehavior.start,
/// ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
/// String? restorationId,
/// Clip clipBehavior = Clip.hardEdge,
/// })

class GridViewExample extends StatefulWidget {
  final String title;

  const GridViewExample({Key? key, required this.title}) : super(key: key);

  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Text("SliverGridDelegateWithFixedCrossAxisCount"),
          SizedBox(
            height: 210,
            child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, //横轴4个子widget
                  childAspectRatio: 1.0, //宽高比为1时，子widget
                  mainAxisSpacing: 10, // 主轴方向的间距
                  crossAxisSpacing: 10, // 横轴方向子元素的间距
                ),
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.cyan),
                    child: Icon(Icons.ac_unit),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.cyan),
                    child: Icon(Icons.airport_shuttle),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.cyan),
                    child: Icon(Icons.all_inclusive),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.cyan),
                    child: Icon(Icons.beach_access),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.cyan),
                    child: Icon(Icons.cake),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.cyan),
                    child: Icon(Icons.free_breakfast),
                  ),
                ]),
          ),
          Text("SliverGridDelegateWithMaxCrossAxisExtent"),
          SizedBox(
            height: 100,
            child: GridView(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100.0,
                  childAspectRatio: 3.0
                  ),
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            ),
          ),
          Text("GridView.count"),
          SizedBox(
            height: 210,
            child: GridView.count(
              crossAxisCount: 4, //横轴4个子widget
              childAspectRatio: 1.0, //宽高比为1时，子widget
              mainAxisSpacing: 10, // 主轴方向的间距
              crossAxisSpacing: 10, // 横轴方向子元素的间距
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.cyan),
                  child: Icon(Icons.ac_unit),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.cyan),
                  child: Icon(Icons.airport_shuttle),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.cyan),
                  child: Icon(Icons.all_inclusive),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.cyan),
                  child: Icon(Icons.beach_access),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.cyan),
                  child: Icon(Icons.cake),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.cyan),
                  child: Icon(Icons.free_breakfast),
                ),
              ],
            ),
          ),
          Text("GridView.extent"),
          SizedBox(
            height: 100,
            child: GridView.extent(
              maxCrossAxisExtent: 100.0,
              childAspectRatio: 3.0,
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            ),
          ),
          Text("GridView.builder"),
          SizedBox(
            height: 300,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //每行三列
                childAspectRatio: 1.0 / .5, //显示区域宽高相等
                mainAxisSpacing: 10, // 主轴方向的间距
                crossAxisSpacing: 10, // 横轴方向子元素的间距
              ),
              itemCount: _icons.length,
              itemBuilder: (context, index) {
                //如果显示到最后一个并且Icon总数小于200时继续获取数据
                if (index == _icons.length - 1 && _icons.length < 200) {
                  _retrieveIcons();
                }
                return DecoratedBox(
                  decoration: BoxDecoration(color: Colors.cyan),
                  child: Icon(_icons[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
