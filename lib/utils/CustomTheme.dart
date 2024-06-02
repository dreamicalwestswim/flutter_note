import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:using_notes/store/settings_store.dart';

class CustomTheme {

  /// 获取亮度
  static Brightness getBrightness(String? themeMode) {
    Brightness brightness;
    if(themeMode == ThemeMode.dark.value){
      brightness = Brightness.dark;
    }  else if(themeMode == ThemeMode.light.value){
      brightness = Brightness.light;
    } else {
      brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    }
    return brightness;
  }

  /// 对主题数据进行自定义
  static ThemeData getThemeData(String? themeMode) {
    return ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        /// 应用程序主色调
        primarySwatch: Colors.amber,
        /// 程序的强调色
        accentColor: Colors.black,
        /// 卡片的背景颜色
        // cardColor: Colors.blue,
        /// 程序的背景颜色
        backgroundColor: Colors.white,
        /// 错误的颜色
        // errorColor: Colors.blue,
        brightness: getBrightness(themeMode),
      ),
    );
  }
}