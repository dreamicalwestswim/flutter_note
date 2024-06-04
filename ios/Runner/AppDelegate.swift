import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FlutterMessagesPlugin.register(with: self.registrar(forPlugin: "FlutterMessagesPlugin")!)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


}

// flutter消息插件，监听flutter发过来的信息并处理
class FlutterMessagesPlugin: NSObject, FlutterPlugin {
  static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.example.notes/channel", binaryMessenger: registrar.messenger())
    let instance = FlutterMessagesPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "getBatteryLevel":
          getBatteryLevel(result: result)
      case "getDeviceName":
        getDeviceName(result: result)
      default:
        result(FlutterMethodNotImplemented)
      }
    
  }

  private func getBatteryLevel(result: @escaping FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if device.batteryState != .unknown {
      result(Int(device.batteryLevel * 100))
    } else {
      result(FlutterError(code: "UNAVAILABLE", message: "Battery info unavailable", details: nil))
    }
  }
    
    private func getDeviceName(result: FlutterResult) {
      let deviceName = UIDevice.current.name
      result(deviceName)
    }
}
