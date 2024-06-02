import 'package:flutter/material.dart';

class TextFieldExample extends StatefulWidget {
  final String title;

  const TextFieldExample({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'TextField',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          Table(
            border: TableBorder.all(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
              borderRadius: BorderRadius.circular(5),
            ),
            children: const [
              TableRow(
                children: [
                  TableCell(child: Text("TextEditingController? controller")),
                  TableCell(
                      child: Text(
                          "编辑框的控制器，通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件。大多数情况下我们都需要显式提供一个controller来与文本框交互。如果没有提供controller，则TextField内部会自动创建一个。")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("FocusNode? focusNode")),
                  TableCell(child: Text("用于控制TextField是否占有当前键盘的输入焦点。")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                          "InputDecoration? decoration = const InputDecoration()")),
                  TableCell(child: Text("用于控制TextField的外观显示，如提示文本、背景颜色、边框等。")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("TextInputType? keyboardType")),
                  TableCell(child: Text("用于设置该输入框默认的键盘输入类型")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("TextInputAction? textInputAction")),
                  TableCell(child: Text("键盘动作按钮图标(即回车键位图标)，它是一个枚举值，有多个可选值")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                          "TextCapitalization textCapitalization = TextCapitalization.none")),
                  TableCell(child: Text("控制大小写")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("TextStyle? style")),
                  TableCell(child: Text("文本样式")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("StrutStyle? strutStyle")),
                  TableCell(child: Text("额外样式")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text("TextAlign textAlign = TextAlign.start")),
                  TableCell(child: Text("水平方向的对齐方式")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text("TextAlignVertical? textAlignVertical")),
                  TableCell(child: Text("文本垂直对齐")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("TextDirection? textDirection")),
                  TableCell(child: Text("文本方向")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("bool readOnly = false")),
                  TableCell(child: Text("只读")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("ToolbarOptions? toolbarOptions")),
                  TableCell(
                      child: Text(
                          "长按或鼠标右击时出现的菜单，包括 copy、cut、paste 以及 selectAll。")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("bool? showCursor")),
                  TableCell(child: Text("显示光标")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("bool autofocus = false")),
                  TableCell(child: Text("是否自动获取焦点")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("String obscuringCharacter = '•'")),
                  TableCell(child: Text("设置隐藏文本替换的字符，默认文本内容会用“•”替换。")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("bool obscureText = false")),
                  TableCell(child: Text("是否替换文本为obscuringCharacter的字符")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("bool autocorrect = true")),
                  TableCell(child: Text("自动更正")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("SmartDashesType? smartDashesType")),
                  TableCell(child: Text("智能破折号类型")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("SmartQuotesType? smartQuotesType")),
                  TableCell(child: Text("智能报价类型")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("bool enableSuggestions = true")),
                  TableCell(child: Text("启用建议")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("int? maxLines = 1")),
                  TableCell(child: Text("输入框的最大行数，默认为1；如果为null，则无行数限制。")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("int? minLines")),
                  TableCell(child: Text("最小行")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("bool expands")),
                  TableCell(child: Text("扩展")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("int? maxLength")),
                  TableCell(
                      child:
                          Text("maxLength代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数。")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child:
                          Text("MaxLengthEnforcement? maxLengthEnforcement,")),
                  TableCell(
                      child: Text(
                          "maxLengthEnforcement决定当输入文本长度超过maxLength时如何处理，如截断、超出等。")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("void Function(String)? onChanged")),
                  TableCell(
                      child: Text("输入框内容改变时的回调函数；注：内容改变事件也可以通过controller来监听。")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("void Function()? onEditingComplete")),
                  TableCell(child: Text("输入完成按下对号键触发")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("void Function(String)? onSubmitted")),
                  TableCell(child: Text("输入完成按下提交键触发")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                          "void Function(String, Map )? onAppPrivateCommand")),
                  TableCell(child: Text("应用程序专用命令")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("List ? inputFormatters")),
                  TableCell(child: Text("用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验。")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("bool? enabled")),
                  TableCell(child: Text("如果为false，则输入框会被禁用")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("double cursorWidth = 2.0")),
                  TableCell(child: Text("输入框光标宽度")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("double? cursorHeight")),
                  TableCell(child: Text("输入框光标高度")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("Radius? cursorRadius")),
                  TableCell(child: Text("输入框光标圆角")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("Color? cursorColor")),
                  TableCell(child: Text("输入框光标颜色")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                          "BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight")),
                  TableCell(child: Text("选择高度样式")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                          "BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight")),
                  TableCell(child: Text("选择高度样式")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("Brightness? keyboardAppearance")),
                  TableCell(child: Text("键盘外观")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                          "EdgeInsets scrollPadding = const EdgeInsets.all(20.0)")),
                  TableCell(child: Text("滚动填充")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                          "DragStartBehavior dragStartBehavior = DragStartBehavior.start")),
                  TableCell(child: Text("滑块开始位置")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("bool? enableInteractiveSelection")),
                  TableCell(child: Text("启用交互选择")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text("TextSelectionControls? selectionControls")),
                  TableCell(child: Text("选择控件")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("void Function()? onTap")),
                  TableCell(child: Text("点击")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("MouseCursor? mouseCursor")),
                  TableCell(child: Text("鼠标样式")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                          "Widget? Function(BuildContext, {required int currentLength, required bool isFocused, required int? maxLength})? buildCounter")),
                  TableCell(child: Text("根据当前文本长度和最大长度构建计数器提示")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("ScrollController? scrollController")),
                  TableCell(child: Text("滚动控制器")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("ScrollPhysics? scrollPhysics")),
                  TableCell(child: Text("滚动物理学")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text("Iterable ? autofillHints = const  []")),
                  TableCell(child: Text("自动填充提示")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("Clip clipBehavior = Clip.hardEdge")),
                  TableCell(child: Text("裁剪模式")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("String? restorationId")),
                  TableCell(child: Text("还原Id")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("bool scribbleEnabled = true")),
                  TableCell(child: Text("启用涂鸦")),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text("bool enableIMEPersonalizedLearning = true")),
                  TableCell(child: Text("启用IME个性化学习")),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'InputDecoration',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          Table(
              border: TableBorder.all(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid,
                borderRadius: BorderRadius.circular(5),
              ),
              children: const [
                TableRow(
                  children: [
                    TableCell(child: Text("Widget? icon")),
                    TableCell(child: Text("图标")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Color? iconColor")),
                    TableCell(child: Text("图标颜色")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Widget? label")),
                    TableCell(child: Text("标签")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("String? labelText")),
                    TableCell(child: Text("标签文字")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("TextStyle? labelStyle")),
                    TableCell(child: Text("标签样式")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("TextStyle? floatingLabelStyle")),
                    TableCell(child: Text("浮动标签样式")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("String? helperText")),
                    TableCell(child: Text("帮助文字")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("TextStyle? helperStyle")),
                    TableCell(child: Text("帮助样式")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("int? helperMaxLines")),
                    TableCell(child: Text("帮助最大行")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("String? hintText")),
                    TableCell(child: Text("占位提示文本")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("TextStyle? hintStyle")),
                    TableCell(child: Text("占位提示样式")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("TextDirection? hintTextDirection")),
                    TableCell(child: Text("占位提示方向")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("int? hintMaxLines")),
                    TableCell(child: Text("占位提示最大行")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("String? errorText")),
                    TableCell(child: Text("错误文字")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("TextStyle? errorStyle")),
                    TableCell(child: Text("错误文字样式")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("int? errorMaxLines")),
                    TableCell(child: Text("错误最大行")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                        child: Text(
                            "FloatingLabelBehavior? floatingLabelBehavior")),
                    TableCell(child: Text("浮动标签行为")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                        child: Text(
                            "FloatingLabelAlignment? floatingLabelAlignment")),
                    TableCell(child: Text("浮动标签对齐")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("bool isCollapsed = false")),
                    TableCell(child: Text("是否折叠")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("bool? isDense")),
                    TableCell(child: Text("是稠密的")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                        child: Text("EdgeInsetsGeometry? contentPadding")),
                    TableCell(child: Text("内容填充")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Widget? prefixIcon")),
                    TableCell(child: Text("前缀图标")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                        child: Text("BoxConstraints? prefixIconConstraints")),
                    TableCell(child: Text("前缀图标约束")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Widget? prefix")),
                    TableCell(child: Text("前缀")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("String? prefixText")),
                    TableCell(child: Text("前缀文本")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("TextStyle? prefixStyle")),
                    TableCell(child: Text("前缀样式")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Color? prefixIconColor")),
                    TableCell(child: Text("前缀图标颜色")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Widget? suffixIcon")),
                    TableCell(child: Text("后缀图标")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Widget? suffix")),
                    TableCell(child: Text("后缀")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("String? suffixText")),
                    TableCell(child: Text("后缀文本")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("TextStyle? suffixStyle")),
                    TableCell(child: Text("后缀样式")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Color? suffixIconColor")),
                    TableCell(child: Text("后缀图标颜色")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                        child: Text("BoxConstraints? suffixIconConstraints")),
                    TableCell(child: Text("后缀图标约束")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Widget? counter")),
                    TableCell(child: Text("计数器")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("String? counterText")),
                    TableCell(child: Text("计数文本")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("TextStyle? counterStyle")),
                    TableCell(child: Text("计数样式")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("bool? filled")),
                    TableCell(child: Text("填充")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Color? fillColor")),
                    TableCell(child: Text("填充颜色")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Color? focusColor")),
                    TableCell(child: Text("聚焦颜色")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("Color? hoverColor")),
                    TableCell(child: Text("hover颜色")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("InputBorder? errorBorder")),
                    TableCell(child: Text("错误边框")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("InputBorder? focusedBorder")),
                    TableCell(child: Text("聚焦边框")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("InputBorder? focusedErrorBorder")),
                    TableCell(child: Text("聚焦错误边框")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("InputBorder? disabledBorder")),
                    TableCell(child: Text("禁用边框")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("InputBorder? enabledBorder")),
                    TableCell(child: Text("开启边框")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("InputBorder? border")),
                    TableCell(child: Text("边框")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("bool enabled = true")),
                    TableCell(child: Text("启用")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("String? semanticCounterText")),
                    TableCell(child: Text("语义计数器文本")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("bool? alignLabelWithHint")),
                    TableCell(child: Text("将标签与提示对齐")),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("BoxConstraints? constraints")),
                    TableCell(child: Text("约束条件")),
                  ],
                ),
              ]),
        ]));
  }
}
