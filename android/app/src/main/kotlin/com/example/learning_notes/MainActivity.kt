package com.example.learning_notes

import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel;
import android.os.BatteryManager;
import android.content.Context;

class MainActivity: FlutterActivity(){
    // 设置通道标识
    private val CHANNEL = "com.example.notes/channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // 确保只有在 binaryMessenger 不为 null 时才执行 MethodChannel 的创建
        flutterEngine?.dartExecutor?.binaryMessenger?.let { binaryMessenger ->
            // 设置MethodChannel并监听来自Flutter的消息
            MethodChannel(binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                // call.method 是flutter 发过来的方法名，根据不同的方法名执行不同的本地操作
                when (call.method) {
                    // 获取电量
                    "getBatteryLevel" -> {
                        val batteryLevel = getBatteryLevel()
                        // 不等于-1就说明成功了返回电量信息
                        if (batteryLevel != -1) {
                            result.success(batteryLevel)
                        } else {
                            // 失败返回错误信息
                            result.error("UNAVAILABLE", "Battery level not available.", null)
                        }
                    }
                    // 获取设备名称
                    "getDeviceName" -> {
                        val deviceName = getDeviceName()
                        result.success(deviceName)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
        }
    }

    // 获取设备电量
    private fun getBatteryLevel(): Int {
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }

    // 获取设备名称
    private fun getDeviceName(): String {
        return "${Build.MANUFACTURER} ${Build.MODEL}"
    }
}
