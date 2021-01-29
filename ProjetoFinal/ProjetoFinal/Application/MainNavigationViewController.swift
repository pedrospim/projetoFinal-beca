//
//  MainNavigationViewController.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 29/01/21.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarHidden(true, animated: false)
        self.viewControllers = [MainTabBarViewController()]
    }

}
