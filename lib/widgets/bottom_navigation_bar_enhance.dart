import 'package:flutter/material.dart';

/// 数据签名
class BottomNavigationBarEnhanceItem{
  /// 默认图标
  String icon;

  /// 选中图标
  String selectedIcon;

  /// 文字
  String label;

  /// 是否展示徽章
  bool isBadgeVisible;

  /// 徽章标签
  String? badgeLabel;

  BottomNavigationBarEnhanceItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.isBadgeVisible = false,
    this.badgeLabel,
  });
}

/// 增强版的底部导航条
class BottomNavigationBarEnhance extends StatelessWidget {

  /// 当前索引
  final int? currentIndex;

  /// 空索引
  final int? emptyIndex;

  /// 颜色
  final Color? color;

  /// 选中颜色
  final Color? selectedColor;

  /// 内容项
  final List<BottomNavigationBarEnhanceItem> items;

  /// 点击事件回调
  final void Function(int index) onTap;

  const BottomNavigationBarEnhance({
    super.key,
    this.currentIndex = 0,
    this.emptyIndex,
    required this.items,
    this.color = Colors.black12,
    this.selectedColor = Colors.black,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var children = items.asMap().entries.map((e) {
      BottomNavigationBarEnhanceItem item = e.value;
      int index = e.key;
      bool isCurrent = currentIndex == index;

      return Expanded(
        flex: 2,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            if(!isCurrent){
              onTap(index);
            }
          },
          child: AnimatedScale(
            scale: isCurrent ? 1 : .9,
            duration: const Duration(milliseconds: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Badge(
                  isLabelVisible: item.isBadgeVisible,
                  label: item.badgeLabel != null ? Text(item.badgeLabel!) : null,
                  smallSize: 8,
                  backgroundColor: Colors.red,
                  child: Image.asset(
                    isCurrent ? item.selectedIcon : item.icon,
                    width: 25,
                    gaplessPlayback: true,
                  ),
                ),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 13,
                    color: isCurrent ? selectedColor : color,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

    }).toList();

    // 往空索引的位置插入占位内容
    if(emptyIndex != null){
      children.insert(emptyIndex!, const Expanded(flex: 1, child: SizedBox()));
    }

    return BottomAppBar(
      // 去除表面附着色
      surfaceTintColor: Colors.transparent,
      // 去除填充
      padding: EdgeInsets.zero,
      height: 60,
      color: const Color(0xffffffff),
      // 底部导航栏打一个圆形的洞（只有Scaffold里面设置了浮动按钮才会出现打孔效果）
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    );
  }
}
