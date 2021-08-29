import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let flutterViewController = window?.rootViewController as! FlutterViewController

    let engine2 = FlutterEngine.init()
    engine2.run(withEntrypoint: "myOtherEntrypoint", libraryURI: "")
    let flutterViewController2 = FlutterViewController.init(
      engine: engine2, nibName: nil, bundle: nil
    )

    window?.rootViewController = WrapperController.init(
      flViewCtl: flutterViewController, flViewCtl2: flutterViewController2
    )

    GeneratedPluginRegistrant.register(with: self)
    GeneratedPluginRegistrant.register(with: engine2)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
