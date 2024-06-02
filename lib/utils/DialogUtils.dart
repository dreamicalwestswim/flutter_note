import 'package:flutter/material.dart';

enum SnackBarType {
  success,
  error,
  warning,
  info,
}

/// 对话框工具类
abstract class DialogUtils {
  static final List<Map<String, Object>> _dialogList = [];

  /// 注册对话框实例
  static void _registerDialog(String id, BuildContext context) {
    _dialogList.add({'id': id, 'context': context});
    print(_dialogList);
  }

  /// 移除对话框实例
  static void _unregisterDialog(String id) {
    _dialogList.removeWhere((dialog) => dialog['id'] == id);
    print(_dialogList);
  }

  /// 清除所有对话框
  static void clearAllDialogs() {
    for (var dialog in _dialogList) {
      Navigator.of(dialog['context'] as BuildContext).pop();
    }
    _dialogList.clear();
  }

  /// Alert对话框
  static Future<T?> showAlertDialog<T>({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
  }) {
    String id = UniqueKey().toString();
    return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        _registerDialog(id, context);
        return AlertDialog(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onCancel();
                Navigator.of(context).pop();
              },
              child: Text(cancelText),
            ),
            ElevatedButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: Text(confirmText),
            ),
          ],
        );
      },
    ).then((value) {
      _unregisterDialog(id);
      return value;
    });
  }

  /// 简易对话框
  static void showSimpleDialog({
    required BuildContext context,
    required String title,
    required List<Widget> options,
  }) {
    String id = UniqueKey().toString();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        _registerDialog(id, context);
        return SimpleDialog(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          children: options,
        );
      },
    ).then((_) {
       _unregisterDialog(id);
    });
  }

  /// 异步对话框
  static Future<T?> showAsyncDialog<T>({
    required BuildContext context,
    required Widget dialogContent,
  }) {
    String id = UniqueKey().toString();
    return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        _registerDialog(id, context);
        return Dialog(
          child: dialogContent,
        );
      },
    ).then((value) {
      _unregisterDialog(id);
      return value;
    });
  }

  /// loading对话框
  static void showLoadingDialog({
    required BuildContext context,
    String loadingText = "正在加载，请稍后...",
  }) {
    String id = UniqueKey().toString();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        _registerDialog(id, context);
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text(loadingText),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _unregisterDialog(id);
    });
  }

  /// bottomSheet对话框
  static void showBottomSheet({
    required BuildContext context,
    required Widget child,
    /// 圆角半径
    double radius = 15,
    /// 宽度百分比0-1
    double width = 1,
    /// 高度百分比0-1
    double maxHeight = 0.8,
  }) {
    String id = UniqueKey().toString();
    showModalBottomSheet<int>(
      context: context,
      /// 圆角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)
        ),
      ),
      isScrollControlled: true,
      /// 限制尺寸
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * width,
        maxHeight: MediaQuery.of(context).size.height * maxHeight,
      ),
      builder: (BuildContext context) {
        _registerDialog(id, context);
        return Column(
          children: [
            Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(5),
                )),
            Expanded(child: child),
          ],
        );
      },
    ).whenComplete(() {
      _unregisterDialog(id);
    });
  }

  /// SnackBar
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({
    required BuildContext context,
    required String content,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 2),
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) {
    Color backgroundColor;
    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green.withOpacity(0.7);
        break;
      case SnackBarType.error:
        backgroundColor = Colors.red.withOpacity(0.7);
        break;
      case SnackBarType.warning:
        backgroundColor = Colors.orange.withOpacity(0.7);
        break;
      case SnackBarType.info:
        backgroundColor = Colors.blue.withOpacity(0.7);
        break;
    }

    final snackBar = SnackBar(
      content: Text(content),
      duration: duration,
      backgroundColor: backgroundColor,
      action: actionLabel != null && onActionPressed != null
          ? SnackBarAction(
        label: actionLabel,
        onPressed: onActionPressed,
        textColor: Colors.white,
      )
          : null,
    );

    hideCurrentSnackBar(context);
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void hideCurrentSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
