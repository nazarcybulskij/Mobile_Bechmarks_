import Flutter
import UIKit

public class SwiftSuperPiFlutterNativePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "super_pi_flutter_native", binaryMessenger: registrar.messenger())
    let instance = SwiftSuperPiFlutterNativePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
