//
//  AppDelegate.swift
//  IOSCase
//
//  Created by OO E on 4.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        
        createRootViewController()
        
        return true
    }
}

extension AppDelegate {
    
    func createRootViewController() {
  
        let rootVc = TermsListController()
        let navigationController:UINavigationController = UINavigationController(rootViewController: rootVc)
        if let window = self.window{
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
}

