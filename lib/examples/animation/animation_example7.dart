import 'package:flutter/material.dart';

/// AnimatedPadding	在padding发生变化时会执行过渡动画到新状态
/// AnimatedPositioned	配合Stack一起使用，当定位状态发生变化时会执行过渡动画到新的状态。
/// AnimatedOpacity	在透明度opacity发生变化时执行过渡动画到新状态
/// AnimatedAlign	当alignment发生变化时会执行过渡动画到新的状态。
/// AnimatedContainer	当Container属性发生变化时会执行过渡动画到新的状态。
/// AnimatedDefaultTextStyle	当字体样式发生变化时，子组件中继承了该样式的文本组件会动态过渡到新样式。

class AnimationExample7 extends StatefulWidget {
  final String title;

  const AnimationExample7({Key? key, required this.title}) : super(key: key);

  @override
  State<AnimationExample7> createState() => _AnimationExample7State();
}

class _AnimationExample7State extends State<AnimationExample7> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = const TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    var duration = const Duration(milliseconds: 400);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _padding = 20;
                });
              },
              child: AnimatedPadding(
                duration: duration,
                padding: EdgeInsets.all(_padding),
                child: const Text("AnimatedPadding"),
              ),
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: duration,
                    left: _left,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _left = 100;
                        });
                      },
                      child: const Text("AnimatedPositioned"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey,
              child: AnimatedAlign(
                duration: duration,
                alignment: _align,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _align = Alignment.center;
                    });
                  },
                  child: const Text("AnimatedAlign"),
                ),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              height: _height,
              color: _color,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _height = 150;
                    _color = Colors.blue;
                  });
                },
                child: const Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedDefaultTextStyle(
              child: GestureDetector(
                child: const Text("hello world"),
                onTap: () {
                  setState(() {
                    _style = const TextStyle(
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue,
                    );
                  });
                },
              ),
              style: _style,
              duration: duration,
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: duration,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  setState(() {
                    _opacity = 0.2;
                  });
                },
                child: const Text(
                  "AnimatedOpacity",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedDecoratedBox1(
              duration: Duration(
                  milliseconds: _decorationColor == Colors.red ? 400 : 2000),
              decoration: BoxDecoration(color: _decorationColor),
              child: Builder(builder: (context) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      _decorationColor = _decorationColor == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                    });
                  },
                  child: const Text(
                    "AnimatedDecoratedBox toggle",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            )
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}


class AnimatedDecoratedBox1 extends StatefulWidget {
  const AnimatedDecoratedBox1({
    Key? key,
    required this.decoration,
    required this.child,
    this.curve = Curves.linear,
    required this.duration,
    this.reverseDuration,
  }) : super(key: key);

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration? reverseDuration;

  @override
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
    with SingleTickerProviderStateMixin {
  @protected
  AnimationController get controller => _controller;
  late AnimationController _controller;

  Animation<double> get animation => _animation;
  late Animation<double> _animation;

  late DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) _updateCurve();
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;
    //正在执行过渡动画
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;

      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}