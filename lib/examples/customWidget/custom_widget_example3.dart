import 'package:flutter/material.dart';
import 'dart:math';

/// CustomPaint({
/// Key? key,
/// CustomPainter? painter, 背景画笔，会显示在子节点后面;
/// CustomPainter? foregroundPainter, 前景画笔，会显示在子节点前面
/// Size size = Size.zero, 当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸。如果有child但是想指定画布为特定大小，可以使用SizeBox包裹CustomPaint实现。
/// bool isComplex = false, 是否复杂的绘制，如果是，Flutter会应用一些缓存策略来减少重复渲染的开销。
/// bool willChange = false, 和isComplex配合使用，当启用缓存时，该属性代表在下一帧中绘制是否会改变。
/// Widget? child,
/// })

/// 重新绘制边界, 独立每一个子元素，防止其他地方绘制影响内部重绘。
/// RepaintBoundary

class CustomWidgetExample3 extends StatefulWidget {
  final String title;

  const CustomWidgetExample3({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomWidgetExample3> createState() => _CustomWidgetExample3State();
}

class _CustomWidgetExample3State extends State<CustomWidgetExample3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RepaintBoundary(
              child: CustomPaint(
                size: Size(300, 300), //指定画布大小
                painter: MyPainter(),
              ),
            ),
            //添加一个刷新button
            ElevatedButton(onPressed: () {}, child: Text("刷新"))
          ],
        ),
      )
    );
  }
}

class MyPainter extends CustomPainter {
  /// Canvas
  /// drawLine	画线
  /// drawPoint	画点
  /// drawPath	画路径
  /// drawImage	画图像
  /// drawRect	画矩形
  /// drawCircle	画圆
  /// drawOval	画椭圆
  /// drawArc	画圆弧
  ///
  /// Size：当前绘制区域大小。
  @override
  void paint(Canvas canvas, Size size) {
    print('paint');
    var rect = Offset.zero & size;
    //画棋盘
    drawChessboard(canvas, rect);
    //画棋子
    drawPieces(canvas, rect);
  }

  // 返回false, 后面介绍
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void drawChessboard(Canvas canvas, Rect rect) {
  /// Paint canvas上色
  //棋盘背景
  var paint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill //填充
    ..color = Color(0xFFDCC48C);
  canvas.drawRect(rect, paint);

  //画棋盘网格
  paint
    ..style = PaintingStyle.stroke //线
    ..color = Colors.black38
    ..strokeWidth = 1.0;

  //画横线
  for (int i = 0; i <= 15; ++i) {
    double dy = rect.top + rect.height / 15 * i;
    canvas.drawLine(Offset(rect.left, dy), Offset(rect.right, dy), paint);
  }

  for (int i = 0; i <= 15; ++i) {
    double dx = rect.left + rect.width / 15 * i;
    canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paint);
  }
}

//画棋子
void drawPieces(Canvas canvas, Rect rect) {
  double eWidth = rect.width / 15;
  double eHeight = rect.height / 15;
  //画一个黑子
  var paint = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.black;
  //画一个黑子
  canvas.drawCircle(
    Offset(rect.center.dx - eWidth / 2, rect.center.dy - eHeight / 2),
    min(eWidth / 2, eHeight / 2) - 2,
    paint,
  );
  //画一个白子
  paint.color = Colors.white;
  canvas.drawCircle(
    Offset(rect.center.dx + eWidth / 2, rect.center.dy - eHeight / 2),
    min(eWidth / 2, eHeight / 2) - 2,
    paint,
  );
}