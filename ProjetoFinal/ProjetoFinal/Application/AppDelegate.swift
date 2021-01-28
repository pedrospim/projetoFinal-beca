//
//  AppDelegate.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 21/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?
    let favorites = Favorites()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        sharedFavorites.checkIfFirstTime()
        self.window?.rootViewController = MainTabBarViewController()
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
}
