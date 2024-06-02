import 'package:flutter/material.dart';



/// ValueListenableBuilder({
/// Key? key,
/// required ValueListenable  valueListenable, 类型为 ValueListenable<T>，表示一个可监听的数据源。
/// required Widget Function(BuildContext, int, Widget?) builder, 数据源发生变化通知时，会重新调用 builder 重新 build 子组件树。
/// Widget? child, builder 中每次都会重新构建整个子组件树，如果子组件树中有一些不变的部分，可以传递给child，child 会作为builder的第三个参数传递给 builder，通过这种方式就可以实现组件缓存，原理和AnimatedBuilder 第三个 child 相同。
/// })

/// 关于 ValueListenableBuilder 有两点需要牢记：
/// 和数据流向无关，可以实现任意流向的数据共享。
/// 实践中，ValueListenableBuilder 的拆分粒度应该尽可能细，可以提高性能。


class ValueListenableBuilderExample extends StatefulWidget {
  final String title;

  const ValueListenableBuilderExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ValueListenableBuilderExample> createState() => _ValueListenableBuilderExampleState();
}

class _ValueListenableBuilderExampleState extends State<ValueListenableBuilderExample> {
  // 定义一个ValueNotifier，当数字变化时会通知 ValueListenableBuilder
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;


  @override
  Widget build(BuildContext context) {
    // 添加 + 按钮不会触发整个 ValueListenableRoute 组件的 build
    print('build');
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: ValueListenableBuilder<int>(
            builder: (BuildContext context, int value, Widget? child) {
              // builder 方法只会在 _counter 变化时被调用
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  child!,
                  Text('$value 次',textScaleFactor: textScaleFactor),
                ],
              );
            },
            valueListenable: _counter,
            // 当子组件不依赖变化的数据，且子组件收件开销比较大时，指定 child 属性来缓存子组件非常有用
            child: const Text('点击了 ', textScaleFactor: textScaleFactor),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        // 点击后值 +1，触发 ValueListenableBuilder 重新构建
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}