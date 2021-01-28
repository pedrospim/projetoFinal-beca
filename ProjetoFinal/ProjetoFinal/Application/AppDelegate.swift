//
//  AppDelegate.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 21/01/21.
//

import UIKit
import Commons

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        sharedFavorites.checkIfFirstTime()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [MainTabBarViewController()]
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
}
