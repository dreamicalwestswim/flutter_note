import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IosBatteryLevelExample extends StatefulWidget {
  const IosBatteryLevelExample({super.key});

  @override
  State<IosBatteryLevelExample> createState() => _IosBatteryLevelState();
}

/// iOS 原生代码位置
/// 原生 iOS 代码通常写在 ios 目录下的 AppDelegate 文件中。具体路径是：
/// Objective-C：ios/Runner/AppDelegate.m
/// Swift：ios/Runner/AppDelegate.swift(如果未找到一定要去xcode里面找，如果直接在其他工具里面创建覆盖，很有可能运行不起来，主要原因是不同版本写法有差异，网上说的和你当前使用的不一定写法一样，所以要找到默认文件，这个是初始化时创建好的正确写法)
/// 踩坑：外部没找到这个文件，直接创建了一份导致怎么都跑不起来，然后对比git修改才发现原来的写法和网上说的不一样，改了一下就成功了.

class _IosBatteryLevelState extends State<IosBatteryLevelExample> {
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
      appBar: AppBar(title: Text("flutter访问ios端的平台信息")),
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