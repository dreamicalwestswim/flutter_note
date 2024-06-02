import 'package:flutter/material.dart';

class ButtonExample11 extends StatelessWidget {
  final String title;

  const ButtonExample11({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("下拉按钮"),
          DropdownButton(
              dropdownColor: Colors.deepPurple,
              icon: Icon(Icons.arrow_right), iconSize: 40, iconEnabledColor: Colors.green.withOpacity(0.7),
              hint: Text('请选择地区'), isExpanded: true, underline: Container(height: 1, color: Colors.green.withOpacity(0.7)),
              items: [
                DropdownMenuItem(
                    child: Row(children: <Widget>[Text('北京'), SizedBox(width: 10), Icon(Icons.ac_unit) ]),
                    value: 1),
                DropdownMenuItem(
                    child: Row(children: <Widget>[Text('天津'), SizedBox(width: 10), Icon(Icons.content_paste) ]),
                    value: 2),
                DropdownMenuItem(
                    child: Row(children: <Widget>[Text('河北', style: TextStyle(color: Colors.purpleAccent, fontSize: 16)), SizedBox(width: 10), Icon(Icons.send, color: Colors.purpleAccent) ]),
                    value: 3)
              ],
              onChanged: print,
          ),
          Text(
            '''
          DropdownButton({
    Key key,
    @required this.items,       // 下拉选项列表
    this.selectedItemBuilder,   // 选项 item 构造器
    this.value,                 // 选中内容
    this.hint,                  // 启动状态下默认内容
    this.disabledHint,          // 禁用状态下默认内容
    @required this.onChanged,   // 选择 item 回调
    void Function()? onTap      // 点击
    this.elevation = 8,         // 阴影高度
    this.style,                 // 选项列表 item 样式
    this.underline,             // 按钮下划线
    this.icon,                  // 下拉按钮图标
    this.iconDisabledColor,     // 禁用状态下图标颜色
    this.iconEnabledColor,      // 启动时图标颜色
    this.iconSize = 24.0,       // 图标尺寸
    this.isDense = false,       // 是否降低按钮高度
    this.isExpanded = false,    // 是否将下拉列表内容设置水平填充
    double? itemHeight = kMinInteractiveDimension,   每一项内容高度
    Color? focusColor,   聚焦颜色
    FocusNode? focusNode,   监听聚焦状态
    bool autofocus = false,   自动聚焦
    Color? dropdownColor,   下拉颜色
    double? menuMaxHeight,   菜单最大高度
    bool? enableFeedback,   开启反馈
    AlignmentGeometry alignment = AlignmentDirectional.centerStart,   对齐方式
    BorderRadius? borderRadius,边框半径
})

const DropdownMenuItem({
    void Function()? onTap,   点击
    int? value,   value
    bool enabled = true,   开启
    AlignmentGeometry alignment = AlignmentDirectional.centerStart,   对齐方式
    required Widget child, 子元素
})
          ''',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ]));
  }
}
