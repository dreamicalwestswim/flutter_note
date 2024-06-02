import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/CustomTheme.dart';
import '../utils/StorageKeys.dart';

abstract class SettingsKeys {
  /// 主题模式
  static const String themeMode = 'themeMode';
  /// 使用的语言
  static const String locale = 'locale';
}

/// 扩展ThemeMode枚举，获取对应字符串，方便储存
extension ThemeModeExtension on ThemeMode {
  String get value => <String>['System','Light','Dark'][index];
}

/// 全局设置
class SettingsStore extends GetxController {
  final GetStorage storageBox = GetStorage();

   final settings = {
     SettingsKeys.themeMode : ThemeMode.system.value,
     SettingsKeys.locale : '${Get.deviceLocale!.languageCode}_${Get.deviceLocale!.countryCode!}'
   }.obs;

  /// 修改设置
  void changeSetting(String key, dynamic value) {

    if(key == SettingsKeys.locale){
      /// 字符串转换成Locale
      final locale = Locale.fromSubtags(languageCode: value);
      /// 修改的是语言需要调用updateLocale实现切换
      Get.updateLocale(locale);

    } else if(key == SettingsKeys.themeMode){

      /// 修改的是颜色模式需要调用changeTheme实现切换
      Get.changeTheme(CustomTheme.getThemeData(value));
    }

    /// 写入到settings里面
    settings[key] = value;

    /// 写入到本地
    storageBox.write(StorageKeys.settings, settings);
  }

  /// 控制器初始化时调用
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    /// 获取上一次设置的内容
    final lastSettings = storageBox.read(StorageKeys.settings);
    if(lastSettings != null){
      try{
        settings.value = lastSettings.cast<String, String>();
      } catch (e) {
        /// 数据被污染了清除
        storageBox.remove(StorageKeys.settings);
      }
    }
  }

}
