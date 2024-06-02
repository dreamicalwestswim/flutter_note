import 'package:flutter/material.dart';

class ContextExample extends StatelessWidget {
  final String title;

  const ContextExample({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // 获取当前的主题数据
    final ThemeData theme = Theme.of(context);

    // 获取当前的媒体查询信息
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // 显示当前主题的颜色
            Text('当前主题的颜色: ${theme.primaryColor}'),
            // 显示屏幕宽度
            Text('屏幕宽度: ${mediaQuery.size.width}'),
            // 显示当前语言环境
            Text('当前语言环境: ${Localizations.localeOf(context)}'),
            // 显示当前路由名称
            Text('当前路由名称: ${ModalRoute.of(context)?.settings.name ?? 'Unknown'}'),
          ],
        ),
      ),
    );
  }
}
