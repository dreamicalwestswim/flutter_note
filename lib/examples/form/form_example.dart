import 'package:flutter/material.dart';

/// Form({
/// Key? key,
/// required Widget child, 子元素
/// Future  Function()? onWillPop, 决定Form所在的路由是否可以直接返回（如点击返回按钮），该回调返回一个Future对象，如果 Future 的最终结果是false，则当前路由不会返回；如果为true，则会返回到上一个路由。此属性通常用于拦截返回按钮。
/// void Function()? onChanged, Form的任意一个子FormField内容发生变化时会触发此回调。
/// AutovalidateMode? autovalidateMode, 自动校验模式
/// })

/// TextFormField({
/// Key? key,
/// TextEditingController? controller, 控制器
/// String? initialValue, 默认值(不能与controller同时使用)
/// FocusNode? focusNode, 焦点控制
/// InputDecoration? decoration = const InputDecoration(), 输入框样式装饰
/// TextInputType? keyboardType,  弹出键盘类型
/// TextCapitalization textCapitalization = TextCapitalization.none, 文字大小写
/// TextInputAction? textInputAction, 键盘动作按钮图标(即回车键位图标)，它是一个枚举值，有多个可选值
/// TextStyle? style, 文字样式
/// StrutStyle? strutStyle, 额外样式
/// TextDirection? textDirection, 文字方向
/// TextAlign textAlign = TextAlign.start, 水平方向的对齐方式
/// TextAlignVertical? textAlignVertical, 文本垂直对齐
/// bool autofocus = false, 自动聚焦
/// bool readOnly = false, 只读
/// ToolbarOptions? toolbarOptions, 长按或鼠标右击时出现的菜单，包括 copy、cut、paste 以及 selectAll。
/// bool? showCursor,  显示光标
/// String obscuringCharacter = '•', 设置隐藏文本替换的字符，默认文本内容会用“•”替换。
/// bool obscureText = false, 是否替换文本为obscuringCharacter的字符
/// bool autocorrect = true, 自动更正
/// SmartDashesType? smartDashesType, 智能破折号类型
/// SmartQuotesType? smartQuotesType,  智能报价类型
/// bool enableSuggestions = true, 启用建议
/// MaxLengthEnforcement? maxLengthEnforcement, maxLengthEnforcement决定当输入文本长度超过maxLength时如何处理，如截断、超出等。
/// int? maxLines = 1, 输入框的最大行数，默认为1；如果为null，则无行数限制。
/// int? minLines, 最小行
/// bool expands = false, 扩展
/// int? maxLength, maxLength代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数。
/// void Function(String)? onChanged, 输入框内容改变时的回调函数；注：内容改变事件也可以通过controller来监听。
/// void Function()? onTap, 点击
/// void Function()? onEditingComplete, 输入完成按下对号键触发
/// void Function(String)? onFieldSubmitted, 输入完成按下提交键触发
/// void Function(String?)? onSaved, 保单保存时触发
/// String? Function(String?)? validator, 表单验证时触发
/// List ? inputFormatters,  用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验。
/// bool? enabled, 如果为false，则输入框会被禁用
/// double cursorWidth = 2.0, 输入框光标宽度
/// double? cursorHeight, 输入框光标高度
/// Radius? cursorRadius, 输入框光标圆角
/// Color? cursorColor, 输入框光标颜色
/// Brightness? keyboardAppearance, 键盘外观
/// EdgeInsets scrollPadding = const EdgeInsets.all(20.0), 滚动填充
/// bool? enableInteractiveSelection, 启用交互选择
/// TextSelectionControls? selectionControls, 选择控件
/// Widget? Function(BuildContext, {required int currentLength, required bool isFocused, required int? maxLength})? buildCounter, 根据当前文本长度和最大长度构建计数器提示
/// ScrollPhysics? scrollPhysics, 滚动回弹
/// Iterable ? autofillHints, 自动填充提示
/// AutovalidateMode? autovalidateMode, 自动校验模式
/// ScrollController? scrollController, 滚动控制器
/// String? restorationId, 还原Id
/// bool enableIMEPersonalizedLearning = true, 启用IME个性化学习
/// MouseCursor? mouseCursor, 鼠标样式
/// })


/// FormState
/// FormState为Form的State类，可以通过Form.of()或GlobalKey获得。我们可以通过它来对Form的子孙FormField进行统一操作。我们看看其常用的三个方法：
/// FormState.validate()：调用此方法后，会调用Form子孙FormField的validate回调，如果有一个校验失败，则返回false，所有校验失败项都会返回用户返回的错误提示。
/// FormState.save()：调用此方法后，会调用Form子孙FormField的save回调，用于保存表单内容
/// FormState.reset()：调用此方法后，会将子孙FormField的内容清空。


class FormExample extends StatefulWidget {
  final String title;

  const FormExample({Key? key, required this.title}) : super(key: key);

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person),
                ),
                // 校验用户名
                validator: (v) {
                  return v!.trim().isNotEmpty ? null : "用户名不能为空";
                },
                onSaved: (v){
                  print(v);
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                //校验密码
                validator: (v) {
                  return v!.trim().length > 5 ? null : "密码不能少于6位";
                },
                onSaved: (v){
                  print(v);
                },
              ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("登录"),
                        ),
                        onPressed: () {
                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。
                          if ((_formKey.currentState as FormState).validate()) {
                            //验证通过提交数据
                            print("提交1");
                          }
                        },
                      ),
                    ),
                    Expanded(
                        // 通过Builder来获取ElevatedButton所在widget树的真正context(Element)
                        child: Builder(builder: (context) {
                      return ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("登录"),
                        ),
                        onPressed: () {
                          //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                          if ((Form.of(context) as FormState).validate()) {
                            //验证通过提交数据
                            print("提交2");
                          }
                        },
                      );
                    })),
                    Expanded(child: Builder(builder: (context) {
                      return OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("取消"),
                        ),
                        onPressed: () {
                          (Form.of(context) as FormState).reset();
                        },
                      );
                    })),
                    Expanded(child: Builder(builder: (context) {
                      return OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("保存"),
                        ),
                        onPressed: () {
                          (Form.of(context) as FormState).save();
                        },
                      );
                    })),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
