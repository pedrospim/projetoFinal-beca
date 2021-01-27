//
//  MainTabBarViewController.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 27/01/21.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .lightGray
        self.tabBar.barTintColor = .black
        self.tabBar.isTranslucent = false
        let coinListViewController = CoinListViewController()
        coinListViewController.tabBarItem = UITabBarItem()
        coinListViewController.tabBarItem.image = UIImage(named: "iconMoney")
        coinListViewController.tabBarItem.title = "Crypto Coins"
        let favoritesViewController = UIViewController()
        favoritesViewController.tabBarItem = UITabBarItem()
        favoritesViewController.tabBarItem.image = UIImage(named: "iconFavorites")
        favoritesViewController.tabBarItem.title = "Adicionadas"
        let tabBarList = [coinListViewController, favoritesViewController]
        viewControllers = tabBarList
    }

}