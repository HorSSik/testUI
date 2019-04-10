//
//  AppDelegate.swift
//  TestUI2
//
//  Created by Dima Omelchenko on 4/10/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    )
        -> Bool
    {
        let rootViewController = StatisticViewController()
        
        let navigationController = UINavigationController.init § rootViewController
        
        navigationController.isNavigationBarHidden = true
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
}

