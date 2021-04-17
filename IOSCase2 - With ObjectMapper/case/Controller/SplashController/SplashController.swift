//
//  SplashController.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import UIKit
class SplashController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        
        
        let vc = NewsListController.createFromStoryboard()
        let navigation = UINavigationController(rootViewController: vc)
        UIApplication.shared.windows.first?.rootViewController = navigation

    }
}
