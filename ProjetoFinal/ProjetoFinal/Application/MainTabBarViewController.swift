//
//  MainTabBarViewController.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 27/01/21.
//

import UIKit
import detalhesBit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .lightGray
        self.tabBar.barTintColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0)
        self.tabBar.isTranslucent = false
        let coinListViewController = CoinListViewController()
        coinListViewController.tabBarItem = UITabBarItem()
        coinListViewController.tabBarItem.image = UIImage(named: "iconMoney")
        coinListViewController.tabBarItem.title = "Crypto Coins"
        let favoritesViewController = FavoritosViewController()
        favoritesViewController.tabBarItem = UITabBarItem()
        favoritesViewController.tabBarItem.image = UIImage(named: "iconFavorites")
        favoritesViewController.tabBarItem.title = "Adicionadas"
        let tabBarList = [coinListViewController, favoritesViewController]
        viewControllers = tabBarList
    }

}
