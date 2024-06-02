import 'package:flutter/material.dart';

// 自定义动画路由
class FadeRoute<T> extends PageRoute<T> {
  /// Creates a route that delegates to builder callbacks.
  ///
  /// The [pageBuilder], [transitionsBuilder], [opaque], [barrierDismissible],
  /// [maintainState], and [fullscreenDialog] arguments must not be null.
  FadeRoute({
    super.settings,
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.reverseTransitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
    super.fullscreenDialog,
    super.allowSnapshotting = true,
  });


  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  /// 打开路由时构建一次路由实例
  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return FadeTransition(
        opacity: animation,
        child: builder(context)
    );
  }

  /// 路由逐帧动画回调函数
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // 可在此对child也就是路由实例进行自定义动画操作
    // return child;

    // 路由进入时使用淡入动画
    if(isActive) {
      return FadeTransition(
        opacity: animation,
        child: child
      );
    }else{
      // 离开时使用缩放动画
      return ScaleTransition(
        scale: animation,
        child: child
      );
    }
  }
}
