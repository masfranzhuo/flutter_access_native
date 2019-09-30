import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller = window?.rootViewController as! FlutterBinaryMessenger
    let channel = FlutterMethodChannel(name: "flutter.native/helper", binaryMessenger: controller)
    channel.setMethodCallHandler({
        [self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        switch call.method {
          case "accessFromNativeCode":
            var res: String = self.accessFromNativeCode()
            result(res)
          default:
            result(FlutterMethodNotImplemented)
        }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func accessFromNativeCode() -> String {
    return "Access From Native IOS Code"
  }
}
