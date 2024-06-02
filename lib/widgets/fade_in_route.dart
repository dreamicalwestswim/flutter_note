import 'package:flutter/cupertino.dart';

/// 淡入淡出路由
class FadeInRoute extends PageRouteBuilder {

  /// 构建widget方法
  final WidgetBuilder builder;

  /// 动画时长
  @override
  final Duration transitionDuration;

  /// 页面是否不透明
  final bool opaque;

  /// 过渡动画完成时调用
  final Function? onTransitionCompleted;

  /// 过渡动画取消或反向完成时调用
  final Function? onTransitionDismissed;

  FadeInRoute({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = false,
    this.onTransitionCompleted,
    this.onTransitionDismissed,
  }) : super(
    opaque: opaque,
    transitionDuration: transitionDuration,
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      animation.addStatusListener((status) {
        if (status == AnimationStatus.completed && onTransitionCompleted != null) {
          onTransitionCompleted();
        } else if (status == AnimationStatus.dismissed && onTransitionDismissed != null) {
          onTransitionDismissed();
        }
      });

      return builder(context);
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );

}