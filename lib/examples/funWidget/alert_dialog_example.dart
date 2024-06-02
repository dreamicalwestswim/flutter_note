import 'package:flutter/material.dart';

/// AlertDialog({
/// Key? key,
/// Widget? title, 对话框标题组件
/// EdgeInsetsGeometry? titlePadding, 标题填充
/// TextStyle? titleTextStyle, 标题文本样式
/// Widget? content, 对话框内容组件
/// EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0), 内容的填充
/// TextStyle? contentTextStyle, 内容文本样式
/// List ? actions, 对话框操作按钮组
/// EdgeInsetsGeometry actionsPadding = EdgeInsets.zero, 按钮组填充
/// MainAxisAlignment? actionsAlignment, 按钮组水平对齐方式
/// OverflowBarAlignment? actionsOverflowAlignment, 按钮组溢出对齐方式
/// VerticalDirection? actionsOverflowDirection, 按钮组溢出方向
/// double? actionsOverflowButtonSpacing, 溢出按钮间距
/// EdgeInsetsGeometry? buttonPadding, 按钮填充
/// Color? backgroundColor, 对话框背景色
/// double? elevation, 对话框的阴影
/// String? semanticLabel, 对话框语义化标签(用于读屏软件)
/// EdgeInsets insetPadding = _defaultInsetPadding,
/// Clip clipBehavior = Clip.none,
/// ShapeBorder? shape, 对话框外形
/// AlignmentGeometry? alignment,
/// bool scrollable = false,
/// })

/// 弹出对话框
/// showDialog ({
/// required BuildContext context,
/// required Widget Function(BuildContext) builder, 对话框UI的builder
/// bool barrierDismissible = true, 点击对话框barrier(遮罩)时是否关闭它
/// Color? barrierColor = Colors.black54, 遮罩颜色
/// String? barrierLabel, 语意标签
/// bool useSafeArea = true, 使用安全区域
/// bool useRootNavigator = true, 使用根导航器
/// RouteSettings? routeSettings, 路由设置
/// Offset? anchorPoint, 锚点
/// })

class AlertDialogExample extends StatefulWidget {
  final String title;

  const AlertDialogExample({Key? key, required this.title}) : super(key: key);

  @override
  State<AlertDialogExample> createState() => _AlertDialogExampleState();
}

class _AlertDialogExampleState extends State<AlertDialogExample> {
  // 弹出对话框
  Future<bool?> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      barrierColor: Colors.green,
      builder: (context) {
        return AlertDialog(
          title: Stack(
            children: [
              Text("提示"),
              Positioned(
                  right: 0,
                  top: 0,
                  child: InkWell(
                      child: Icon(Icons.close),
                      onTap: () {
                        Navigator.of(context).pop();
                      })),
            ],
          ),
          content: Text("您确定要删除当前文件吗?"),
          actionsPadding: EdgeInsets.all(10),
          actionsAlignment: MainAxisAlignment.center,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: Colors.blue,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  // 弹出对话框
  Future<bool?> showDeleteConfirmDialog2() {
    return showDialog<bool>(
      context: context,
      barrierColor: Colors.green,
      builder: (context) {
        return UnconstrainedBox(
          child: Container(
            width: 300,
            height: 200,
            color: Colors.white,
            child: Column(
              children: [
                Text("标题",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black26,
                    )),
                Text(
                  "主要内容",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black26,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text("取消"),
                      onPressed: () => Navigator.of(context).pop(), // 关闭对话框
                    ),
                    TextButton(
                      child: Text("删除"),
                      onPressed: () {
                        //关闭对话框并返回true
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
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
              //弹出对话框并等待其关闭
              bool? delete = await showDeleteConfirmDialog1();
              if (delete == null) {
                print("取消删除");
              } else {
                print("已确认删除");
                //... 删除文件
              }
            },
          ),

          ElevatedButton(
            child: Text("自定义对话框"),
            onPressed: () async {
              //弹出对话框并等待其关闭
              bool? delete = await showDeleteConfirmDialog2();
              if (delete == null) {
                print("取消删除");
              } else {
                print("已确认删除");
                //... 删除文件
              }
            },
          ),

          ElevatedButton(
            child: Text("loading框"),
            onPressed: () async {
              showLoadingDialog();
            },
          ),
        ],
      ),
    );
  }
}
