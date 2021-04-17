//
//  BaseViewController.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import UIKit
import Reachability


class BaseViewController: UIViewController {

    var baseRouter: BaseRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.baseRouter = BaseRouter(parent: self)
    }
}

extension BaseViewController {
    
    func reachabilityChangedStatus(reachibility: Reachability) {
        //If you want subscribe reachability and check connection
    }
    
    func showMessageWith(title: String, message: String) {
        mainThread {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
    }
    
    func showLoader() {
        Loader.show()
    }
    
    func dismissLoader() {
        Loader.dismiss()
    }

}


extension BaseViewController {
    
    @objc class var storyboardName: String {
        return String(describing: self)
    }
    
    @objc class func createFromStoryboard() -> Self {
        let vc = createFromStoryboard(named: storyboardName, type: self)
        if let vc = vc as? UIViewController {
            vc.modalPresentationStyle = .fullScreen
        }
        return vc
    }
    
    static func createFromStoryboard<T: BaseViewController>(named storyboardName: String?, type: T.Type) -> T {
        let vc = UIStoryboard(name: storyboardName ?? self.storyboardName, bundle: Bundle.main).instantiateInitialViewController() as! T
        if let vc = vc as? UIViewController {
            vc.modalPresentationStyle = .fullScreen
        }
        return vc
    }
    
    
}
