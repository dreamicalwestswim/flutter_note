import 'package:flutter/material.dart';

/// showModalBottomSheet ({
/// required BuildContext context,
/// required Widget Function(BuildContext) builder, 构建内容
/// Color? backgroundColor, 背景颜色
/// double? elevation, 阴影大小
/// ShapeBorder? shape, 现状
/// Clip? clipBehavior, 裁剪方式
/// BoxConstraints? constraints, 限制大小
/// Color? barrierColor, 遮罩颜色
/// bool isScrollControlled = false, 全屏滚动
/// bool useRootNavigator = false, 使用根路由
/// bool isDismissible = true,
/// bool enableDrag = true, 启用拖拽控制
/// RouteSettings? routeSettings, 路由设置
/// AnimationController? transitionAnimationController, 展开关闭动画
/// Offset? anchorPoint, 锚点
/// })

class ShowModalBottomSheetExample extends StatefulWidget {
  final String title;

  const ShowModalBottomSheetExample({Key? key, required this.title})
      : super(key: key);

  @override
  State<ShowModalBottomSheetExample> createState() =>
      _ShowModalBottomSheetExampleState();
}

class _ShowModalBottomSheetExampleState
    extends State<ShowModalBottomSheetExample> {
  // 弹出底部菜单列表模态对话框
  Future<int?> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      /// 圆角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      /// 高度占满全屏
      isScrollControlled: true,
      /// 限制尺寸
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: MediaQuery.of(context).size.width * 0.96),
      builder: (BuildContext context) {
        return Column(
          children: [
            Container(
                width: 50,
                height: 5,
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(5),
                )),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          ElevatedButton(
            child: Text("显示底部菜单列表"),
            onPressed: () async {
              int? type = await _showModalBottomSheet();
              print(type);
            },
          ),
        ],
      ),
    );
  }
}
