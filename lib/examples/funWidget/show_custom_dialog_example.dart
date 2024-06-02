import 'package:flutter/material.dart';


/// showGeneralDialog ({
/// required BuildContext context,
/// required Widget Function(BuildContext, Animation , Animation ) pageBuilder, 构建对话框内部UI
/// bool barrierDismissible = false, 点击遮罩是否关闭对话框
/// String? barrierLabel, 语义化标签(用于读屏软件)
/// Color barrierColor = const Color(0x80000000), 遮罩颜色
/// Duration transitionDuration = const Duration(milliseconds: 200), 对话框打开/关闭的动画时长
/// Widget Function(BuildContext, Animation , Animation , Widget)? transitionBuilder,  对话框打开/关闭的动画
/// bool useRootNavigator = true,
/// RouteSettings? routeSettings,
/// Offset? anchorPoint,
/// })

class ShowCustomDialogExample extends StatefulWidget {
  final String title;

  const ShowCustomDialogExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ShowCustomDialogExample> createState() => _ShowCustomDialogExampleState();
}

class _ShowCustomDialogExampleState extends State<ShowCustomDialogExample> {
  Future<void> showDialog() async {
    showCustomDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(true);
              },
            ),
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
          //点击该按钮后弹出对话框
          ElevatedButton(
            child: Text("对话框1"),
            onPressed: () async {
              showDialog();
            },
          ),
        ],
      ),
    );
  }
}

/// 定义对话框打开方式
Future<T?> showCustomDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required WidgetBuilder builder,
  ThemeData? theme,
}) {
  final ThemeData theme = Theme.of(context);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87, // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}
/// 打开动画
Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}