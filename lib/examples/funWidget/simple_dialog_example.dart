import 'package:flutter/material.dart';

/// SimpleDialog({
/// Key? key,
/// Widget? title, 标题组件
/// EdgeInsetsGeometry titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0), 标题填充
/// TextStyle? titleTextStyle, 标题文字样式
/// List ? children, 子元素
/// EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0), 内容填充
/// Color? backgroundColor, 背景颜色
/// double? elevation, 阴影大小
/// String? semanticLabel, 语意标签
/// EdgeInsets insetPadding = _defaultInsetPadding, 对话框内填充
/// Clip clipBehavior = Clip.none, 裁剪模式
/// ShapeBorder? shape, 现状
/// AlignmentGeometry? alignment, 对齐方式
/// })

/// SimpleDialogOption({
/// Key? key,
/// void Function()? onPressed, 点击回调
/// EdgeInsets? padding, 内填充
/// Widget? child, 子元素
/// })

class SimpleDialogExample extends StatefulWidget {
  final String title;

  const SimpleDialogExample({Key? key, required this.title}) : super(key: key);

  @override
  State<SimpleDialogExample> createState() => _SimpleDialogExampleState();
}

class _SimpleDialogExampleState extends State<SimpleDialogExample> {

  Future<void> changeLanguage() async {
    int? i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
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
              changeLanguage();
            },
          ),
        ],
      ),
    );
  }
}
