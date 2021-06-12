//
//  AppDelegate.swift
//  News
//
//  Created by Dunja Acimovic on 30.05.2021..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let initialController = UINavigationController()
        let wireframe = NewsWireframe()
        initialController.setRootWireframe(wireframe)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = initialController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

