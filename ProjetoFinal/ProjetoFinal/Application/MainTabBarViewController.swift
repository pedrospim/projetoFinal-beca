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
        self.tabBar.barTintColor = .black
        self.tabBar.isTranslucent = false
        let coinListViewController = CoinListViewController()
        coinListViewController.tabBarItem = UITabBarItem()
        coinListViewController.tabBarItem.image = UIImage(named: "iconMoney")
        coinListViewController.tabBarItem.title = "Crypto Coins"
        let favoritesViewController = FavoritosViewController("30", "BTC", "10", "jan", "2021", true, 5)
        favoritesViewController.tabBarItem = UITabBarItem()
        favoritesViewController.tabBarItem.image = UIImage(named: "iconFavorites")
        favoritesViewController.tabBarItem.title = "Adicionadas"
        let tabBarList = [coinListViewController, favoritesViewController]
        viewControllers = tabBarList
    }

}
