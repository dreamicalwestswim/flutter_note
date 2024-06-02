import 'dart:ui';

import 'package:flutter/material.dart';

/// Text组件参数
/// String data 显示的文本
/// TextStyle style,  文本样式
/// StrutStyle strutStyle, 字体在文本内的一些偏移，使用时 style 属性必须有值，很少使用
/// TextAlign textAlign, 对齐方式
/// TextDirection textDirection, 文本方向
/// Locale locale, 区域设置，基本不会用
/// bool softWrap, 是否自动换行（true自动换行，false单行显示，超出屏幕部分默认截断处理）
/// TextOverflow overflow, 文字超出屏幕之后的处理方式
/// double textScaleFactor, 字体缩放
/// int maxLines, 文字显示最大行数
/// String semanticsLabel, 语义标签，如文本为"$$"，这里设置为"双美元"
/// TextWidthBasis textWidthBasis, 测量行宽度,一行或多行文本宽度的不同方式
/// TextHeightBehavior textHeightBehavior, 定义如何应用第一行的ascent和最后一行的descent

/// TextStyle参数
/// inherit = true, 继承父级样式, 如果为false，属性将恢复为默认值：白色，字体大小为10像素，采用无衬线字体。
/// color, 文字颜色
/// backgroundColor, 背景颜色
/// fontSize, 字体大小，默认14像素
/// fontWeight, 粗细
/// fontStyle, 字体样式
/// letterSpacing, 文字水平间距
/// wordSpacing, 单词水平间距
/// textBaseline, 对齐文本的水平线
/// height, 行高
/// leadingDistribution,
/// locale, 选择用户语言和格式的标识符
/// foreground, 文本的前景，Paint
/// background, 文本背景, Paint
/// shadows, 投影
/// fontFeatures, 指定字体的多种变体
/// decoration, 文字的线性装饰
/// decorationColor, 文本装饰线的颜色
/// decorationStyle, 文本装饰线的样式
/// decorationThickness, 装饰线粗细
/// debugLabel, 文本样式的描述无实际用处
/// String? fontFamily, 字体
/// List<String>? fontFamilyFallback, 备用字体列表
/// String? package, 用于设置使用哪种自定义字体
/// overflow, 文字超出屏幕之后的处理方式

/// TextAlign枚举
/// left 对齐容器左边缘的文本。
/// right 对齐容器右边缘的文本。
/// center 将文本与容器中心对齐。
/// justify 两端对齐。
/// start 将文本与容器的前缘对齐。。
/// end 对齐容器后缘上的文本。。

/// TextDirection枚举
/// rtl 文本从右向左排列
/// ltr 文本从左向右排列

/// TextOverflow枚举
/// clip 剪切溢出的文本以修复其容器。
/// fade 将溢出的文本淡入透明。
/// ellipsis 使用省略号表示文本溢出。
/// visible 渲染其容器外溢出的文本。

/// TextWidthBasis枚举
/// parent 多行文本的将占用父类给出的全部宽度，针对一行文本只需要包含文本所需要的最小宽度，常见用例为段落
/// longestLine, 宽度刚好可以容纳最长的行，比如聊天气泡

class TextExample extends StatelessWidget {
  final String title;

  const TextExample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5e5e5),
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Text(
            '文本样式style',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            '不继承样式',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'inherit: false',
            style: TextStyle(inherit: false),
          ),
          Text(
            '设置颜色',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'color: Color(0xff23aa45)',
            style: TextStyle(color: Color(0xff23aa45)),
          ),
          Text(
            '设置背景色',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'backgroundColor: Color(0xff23aa45)',
            style: TextStyle(backgroundColor: Color(0xff23aa45)),
          ),
          Text(
            '设置字号',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'fontSize: 30.99',
            style: TextStyle(fontSize: 30.99),
          ),
          Text(
            '设置加粗',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'fontWeight: FontWeight.normal',
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          Text(
            'fontWeight: FontWeight.w100',
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          Text(
            'fontWeight: FontWeight.w200',
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          Text(
            'fontWeight: FontWeight.w300',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          Text(
            'fontWeight: FontWeight.w400',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          Text(
            'fontWeight: FontWeight.w500',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            'fontWeight: FontWeight.w600',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            'fontWeight: FontWeight.w700',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(
            'fontWeight: FontWeight.w800',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          Text(
            'fontWeight: FontWeight.w900',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          Text(
            'fontWeight: FontWeight.bold',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '设置斜体',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'fontStyle: FontStyle.normal',
            style: TextStyle(fontStyle: FontStyle.normal),
          ),
          Text(
            'fontStyle: FontStyle.italic',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            '设置水平间距',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'letterSpacing: 6.66',
            style: TextStyle(letterSpacing: 6.66),
          ),
          Text(
            '设置单词间距',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'wordSpacing: 6.66',
            style: TextStyle(wordSpacing: 6.66),
          ),
          Text(
            '设置文本对齐的水平线',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'textBaseline: TextBaseline.alphabetic',
            style: TextStyle(textBaseline: TextBaseline.alphabetic),
          ),
          Text(
            'textBaseline: TextBaseline.ideographic',
            style: TextStyle(textBaseline: TextBaseline.ideographic),
          ),
          Text(
            '设置行高',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9height:  1.9',
            style: TextStyle(
              height: 1.9,
              backgroundColor: Colors.white24,
            ),
          ),
          Text(
            '设置前景',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'foreground: Paint()..color = Color(0xff23aa45)',
            style: TextStyle(
              foreground: Paint()..color = Color(0xff23aa45),
            ),
          ),
          Text(
            '设置背景',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'background: Paint()..color = Color(0xff23aa45)',
            style: TextStyle(
              background: Paint()..color = Color(0xff23aa45),
            ),
          ),
          Text(
            '设置投影',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            '''shadows: [
                Shadow(
                  color: Colors.deepOrange,
                  offset: Offset(3, 3),
                  blurRadius: 3,
                )
              ]''',
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Colors.deepOrange,
                  offset: Offset(3, 3),
                  blurRadius: 3,
                )
              ],
            ),
          ),
          Text(
            '设置线性装饰',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'decoration: TextDecoration.lineThrough',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Text(
            'decoration: TextDecoration.overline',
            style: TextStyle(
              decoration: TextDecoration.overline,
            ),
          ),
          Text(
            'decoration: TextDecoration.underline',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            'decoration: TextDecoration.combine([TextDecoration.lineThrough, TextDecoration.overline, TextDecoration.underline])',
            style: TextStyle(
              decoration: TextDecoration.combine([
                TextDecoration.lineThrough,
                TextDecoration.overline,
                TextDecoration.underline
              ]),
            ),
          ),
          Text(
            '设置装饰线的颜色',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'decorationColor: Color(0xff23aa45))',
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationColor: Color(0xff23aa45)),
          ),
          Text(
            '设置装饰线的样式',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'decorationStyle: TextDecorationStyle.double',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.double,
            ),
          ),
          Text(
            'decorationStyle: TextDecorationStyle.dashed',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          Text(
            'decorationStyle: TextDecorationStyle.dotted',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.dotted,
            ),
          ),
          Text(
            'decorationStyle: TextDecorationStyle.solid',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
          Text(
            'decorationStyle: TextDecorationStyle.wavy',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.wavy,
            ),
          ),
          Text(
            '设置装饰线的粗细',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'decorationThickness: 6.66',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              decorationThickness: 3.66,
            ),
          ),
          Text(
            '设置主要字体',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'fontFamily: PingFang SC',
            style: TextStyle(
              fontFamily: 'PingFang SC',
            ),
          ),
          Text(
            '设置备用字体',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            "fontFamilyFallback: ['PingFang SC','sans-serif']",
            style: TextStyle(
              fontFamilyFallback: ['PingFang SC', 'sans-serif'],
            ),
          ),
          Text(
            '文字超出容器之后的处理方式',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            "overflow: TextOverflow.visible  111111111111111111111111111111",
            softWrap: false,
            style: TextStyle(
              overflow: TextOverflow.visible,
            ),
          ),
          Text(
            "overflow: TextOverflow.clip  111111111111111111111111111111",
            softWrap: false,
            style: TextStyle(
              overflow: TextOverflow.clip,
            ),
          ),
          Text(
            "overflow: TextOverflow.ellipsis  111111111111111111111111111111",
            softWrap: false,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "overflow: TextOverflow.fade  111111111111111111111111111111",
            softWrap: false,
            style: TextStyle(
              overflow: TextOverflow.fade,
            ),
          ),

          Text(
            '针对高度属性的调整，文字在垂直方向的位置(无效)',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            'leadingDistribution: TextLeadingDistribution.even',
            style: TextStyle(
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          Text(
            'leadingDistribution: TextLeadingDistribution.proportional',
            style: TextStyle(
              leadingDistribution: TextLeadingDistribution.proportional,
            ),
          ),

          Text(
            '对齐方式textAlign',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'textAlign: TextAlign.left',
            textAlign: TextAlign.left,
          ),
          Text(
            'textAlign: TextAlign.center',
            textAlign: TextAlign.center,
          ),
          Text(
            'textAlign: TextAlign.right',
            textAlign: TextAlign.right,
          ),
          Text(
            'textAlign: TextAlign.justify',
            textAlign: TextAlign.justify,
          ),
          Text(
            'textAlign: TextAlign.start',
            textAlign: TextAlign.start,
          ),
          Text(
            'textAlign: TextAlign.end',
            textAlign: TextAlign.end,
          ),
          Text(
            '文本方向textDirection',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'textDirection: TextDirection.ltr aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'textDirection: TextDirection.rtl aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            textDirection: TextDirection.rtl,
          ),

          Text(
            '是否换行softWrap',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'softWrap: false aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
              softWrap: false,
          ),

          Text(
            '文字超出容器之后的处理方式overflow',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'overflow: TextOverflow.visible aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            overflow: TextOverflow.visible,
            softWrap: false,
          ),
          Text(
            'overflow: TextOverflow.fade aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
          Text(
            'overflow: TextOverflow.ellipsis aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
          Text(
            'overflow: TextOverflow.clip aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            overflow: TextOverflow.clip,
            softWrap: false,
          ),

          Text(
            '字体显示比例textScaleFactor',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'textScaleFactor: 2',
            textScaleFactor: 2,
          ),

          Text(
            '显示最大行数maxLines',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'maxLines: 3 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            'textWidthBasis',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'textWidthBasis: TextWidthBasis.parent aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            textWidthBasis: TextWidthBasis.parent,
            style: TextStyle(
              backgroundColor: Colors.greenAccent
            ),
          ),
          Text(
            'textWidthBasis: TextWidthBasis.longestLine aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            textWidthBasis: TextWidthBasis.longestLine,
            style: TextStyle(
                backgroundColor: Colors.greenAccent
            ),
          ),

          Text(
            'TextHeightBehavior',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'textHeightBehavior: TextHeightBehavior()',
            textHeightBehavior: TextHeightBehavior(),
          ),

          Text(
            'StrutStyle(冷门)',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "fontSize: 30",
            strutStyle: StrutStyle(
              fontSize: 30,
            ),
          ),
          Text(
            "height: 2",
            strutStyle: StrutStyle(
              height: 2,
            ),
          ),
          Text(
            "leadingDistribution: TextLeadingDistribution.proportional",
            strutStyle: StrutStyle(
              leadingDistribution: TextLeadingDistribution.proportional,
            ),
          ),
          Text(
            "leadingDistribution: TextLeadingDistribution.even",
            strutStyle: StrutStyle(
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          Text(
            "leading: 3",
            strutStyle: StrutStyle(
              leading: 3,
            ),
          ),
          Text(
            "fontWeight: FontWeight.bold",
            strutStyle: StrutStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "fontStyle: FontStyle.italic",
            strutStyle: StrutStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
