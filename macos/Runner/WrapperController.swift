import Cocoa
import FlutterMacOS

class WrapperController: NSViewController, NSWindowDelegate {
  var flViewCtl: FlutterViewController?
  var flViewCtl2: FlutterViewController?

  init(
    flViewCtl: FlutterViewController,
    flViewCtl2: FlutterViewController
  ) {
    super.init(nibName: nil, bundle: nil)

    self.flViewCtl = flViewCtl
    self.flViewCtl2 = flViewCtl2
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    self.view = NSView()
    self.view.addSubview(self.flViewCtl!.view)
    self.view.addSubview(self.flViewCtl2!.view)
  }

  override func viewDidAppear() {
    super.viewDidAppear()

    self.view.window?.delegate = self
    self.updateSize()
  }

  func windowDidResize(_ notification: Notification) {
    self.updateSize()
  }

  func updateSize() {
    let width = self.view.window?.contentView?.bounds.width ?? 0
    let height = self.view.window?.contentView?.bounds.height ?? 0

    self.view.setFrameSize(NSSize(width: width, height: height))
    self.flViewCtl?.view.frame = CGRect(
      x: 0, y: height / 2, width: width, height: height / 2
    )
    self.flViewCtl2?.view.frame = CGRect(
      x: 0, y: 0, width: width, height: height / 2
    )
  }
}
