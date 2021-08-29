import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()

    let project2 = FlutterDartProject.init()
    project2.dartEntrypointArguments = ["MyApp2"]
    let flutterViewController2 = FlutterViewController.init(project: project2)
    
    let windowFrame = self.frame
    self.contentViewController = WrapperController.init(
      flViewCtl: flutterViewController, flViewCtl2: flutterViewController2
    )
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)
    RegisterGeneratedPlugins(registry: flutterViewController2)

    super.awakeFromNib()
  }
}
