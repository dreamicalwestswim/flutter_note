import 'package:flutter/material.dart';

// 带下划线的文本输入框
class TextFieldUnderline extends StatelessWidget {
  final String? hintText; // 未输入文案
  final bool obscureText; // 点显示文本
  ValueChanged<String>? onChanged; // 输入变化触发
  final int? maxLines;
  final double? height;
  final TextEditingController? controller;

  TextFieldUnderline({
    Key? key,
    this.hintText = "输入内容",
    this.obscureText = false,
    this.onChanged,
    this.maxLines = 1,
    this.height = 45,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none)),
        onChanged: onChanged,
      ),
    );
  }
}
