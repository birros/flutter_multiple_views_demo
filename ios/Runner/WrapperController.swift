import UIKit
import Flutter

class WrapperController: UINavigationController {
  private var flViewCtl: FlutterViewController!
  private var flViewCtl2: FlutterViewController!

  init(flViewCtl: FlutterViewController, flViewCtl2: FlutterViewController) {
    super.init(nibName: nil, bundle: nil)

    self.flViewCtl = flViewCtl
    self.flViewCtl2 = flViewCtl2

    self.setNavigationBarHidden(true, animated: false)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.addSubview(self.flViewCtl.view)
    self.view.addSubview(self.flViewCtl2.view)

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(WrapperController.rotated),
      name: UIDevice.orientationDidChangeNotification,
      object: nil
    )

    self.updateLayout()
  }

  @objc func rotated() {
    self.updateLayout()
  }

  func updateLayout() {
    let width = self.view.frame.width
    let height = self.view.frame.height

    self.flViewCtl.view.frame = CGRect(
      x: 0, y: 0, width: width, height: height / 2
    )    

    self.flViewCtl2.view.frame = CGRect(
      x: 0, y: height / 2, width: width, height: height / 2
    )
  }
}
