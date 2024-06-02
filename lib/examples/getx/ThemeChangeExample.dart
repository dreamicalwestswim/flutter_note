import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:using_notes/store/settings_store.dart';

class ThemeChangeExample extends StatelessWidget {
  const ThemeChangeExample({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsStore = Get.find<SettingsStore>();

    return Scaffold(
      appBar: AppBar(title: Text("123")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Obx(() => TestClean(text: settingsStore.settings[SettingsKeys.themeMode]!,)),
            TextButton(
              child: Text("跟随系统"),
              onPressed: () {
                settingsStore.changeSetting(SettingsKeys.themeMode, ThemeMode.system.value);
              },
            ),
            TextButton(
              child: Text("暗色模式"),
              onPressed: () {
                settingsStore.changeSetting(SettingsKeys.themeMode, ThemeMode.dark.value);
              },
            ),
            TextButton(
              child: Text("明亮模式"),
              onPressed: () {
                settingsStore.changeSetting(SettingsKeys.themeMode, ThemeMode.light.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// 测试Obx回收
class TestClean extends StatefulWidget {
  final String text;

  const TestClean({super.key, required this.text});

  @override
  State<TestClean> createState() => _TestCleanState();
}

class _TestCleanState extends State<TestClean> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Obx里面的元素被清除");
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.text);
  }
}
