import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidBatteryLevelExample extends StatefulWidget {
  const AndroidBatteryLevelExample({super.key});

  @override
  State<AndroidBatteryLevelExample> createState() => _AndroidBatteryLevelState();
}

/// Android 原生代码位置
/// 原生 Android 代码通常写在 android 目录下的 MainActivity 文件中。具体路径是：
/// Java：android/app/src/main/java/com/example/myapp/MainActivity.java
/// Kotlin：android/app/src/main/kotlin/com/example/myapp/MainActivity.kt

class _AndroidBatteryLevelState extends State<AndroidBatteryLevelExample> {
  /// 定义要访问的平台通道
  static const platform = MethodChannel('com.example.notes/channel');

  String _batteryLevel = 'Unknown battery level.';
  String _deviceName = 'Unknown deviceName';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final start = DateTime.now().millisecondsSinceEpoch;
      /// 发送一个消息到原生平台，要求调用名为 'getBatteryLevel' 的方法。
      final int result = await platform.invokeMethod('getBatteryLevel');
      final end = DateTime.now().millisecondsSinceEpoch;
      batteryLevel = 'Battery level at $result % . 获取所消耗的时间${end - start} ms';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<void> _getDeviceName() async {
    String deviceName;
    try {
      final start = DateTime.now().millisecondsSinceEpoch;
      final String result = await platform.invokeMethod('getDeviceName');
      final end = DateTime.now().millisecondsSinceEpoch;
      deviceName = 'Device name: $result 获取所消耗的时间${end - start} ms';
    } on PlatformException catch (e) {
      deviceName = "Failed to get device name: '${e.message}'.";
    }
    setState(() {
      _deviceName = deviceName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("flutter访问android端的平台信息")),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(_batteryLevel),
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: Text('Get Battery Level'),
            ),
            Text(_deviceName),
            ElevatedButton(
              onPressed: _getDeviceName,
              child: Text('Get Device Name'),
            ),
          ],
        ),
      ),
    );
  }
}