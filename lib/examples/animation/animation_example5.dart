import 'package:flutter/material.dart';

// const AnimatedSwitcher({
// Key? key,
// this.child,
// required this.duration, // 新child显示动画时长
// this.reverseDuration,// 旧child隐藏的动画时长
// this.switchInCurve = Curves.linear, // 新child显示的动画曲线
// this.switchOutCurve = Curves.linear,// 旧child隐藏的动画曲线
// this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder, // 动画构建器
// this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder, //布局构建器
// })

class AnimationExample5 extends StatefulWidget {
  final String title;

  const AnimationExample5({Key? key, required this.title}) : super(key: key);

  @override
  State<AnimationExample5> createState() => _AnimationExample5State();
}

class _AnimationExample5State extends State<AnimationExample5> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            AnimatedSwitcher(
              // duration: const Duration(milliseconds: 500),
              // transitionBuilder: (Widget child, Animation<double> animation) {
              //   //执行缩放动画
              //   return ScaleTransition(child: child, scale: animation);
              // },
              // duration: Duration(milliseconds: 200),
              // transitionBuilder: (Widget child, Animation<double> animation) {
              //   var tween=Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
              //   return MySlideTransition(
              //     child: child,
              //     position: tween.animate(animation),
              //   );
              // },
              duration: Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                var tween=Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                return SlideTransitionX(
                  child: child,
                  direction: AxisDirection.down, //上入下出
                  position: animation,
                );
              },
              child: Text(
                '$_count',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            ElevatedButton(
              child: const Text('+1',),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  const MySlideTransition({
    Key? key,
    required Animation<Offset> position,
    this.transformHitTests = true,
    required this.child,
  }) : super(key: key, listenable: position);

  final bool transformHitTests;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<Offset>;
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}


class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key? key,
    required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    required this.child,
  }) : super(key: key, listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: const Offset(0, 1), end: const Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: const Offset(0, -1), end: const Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
        break;
    }
  }

  final bool transformHitTests;

  final Widget child;

  final AxisDirection direction;

  late final Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<double>;
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}