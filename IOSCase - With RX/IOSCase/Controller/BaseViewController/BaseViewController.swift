//
//  BaseViewController.swift
//  IOSCase
//
//  Created by OO E on 6.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit



class BaseViewController: UIViewController {
    
    var router: BaseRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        bindViewModel()
    }
    
}
//MARK: Show Messages
extension BaseViewController {
    
    
    func showMessage(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension BaseViewController: ViewControllerType {
    
    @objc func bindViewModel() {
        
    }
    
    @objc func configureController() {
        router = BaseRouter(parent: self)
    }
    
}

