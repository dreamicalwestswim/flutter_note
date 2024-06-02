import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  /// 子元素
  Widget child;

  /// 宽度
  double width;

  /// 高度
  double height;

  /// 装饰
  Decoration? decoration;

  /// 禁用
  bool disabled;

  /// loading
  bool loading;

  /// 点击事件回调
  void Function()? onTap;

  Button({
    Key? key,
    required this.child,
    this.width = 100,
    this.height = 40,
    this.decoration,
    this.disabled = false,
    this.loading = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool disabled = this.disabled || loading;

    return GestureDetector(
      onTap: (){
        if(disabled != true && onTap != null){
          onTap!();
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: disabled ? 0.5 : 1,
        child: Container(
          width: width,
          height: height,
          decoration: decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Visibility(
                  visible: loading,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      width: height - 20,
                      height: height - 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation(Colors.grey),
                      ),
                    ),
                  )),

              child
            ],
          ),
        ),
      ),
    );
  }
}
