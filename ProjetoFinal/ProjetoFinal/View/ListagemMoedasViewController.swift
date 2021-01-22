//
//  ViewController.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 21/01/21.
//

import UIKit

class ListagemMoedasViewController: UIViewController {
    let client = MoedaAPI()
    var listaMoedas:CoinModel = []

    init() {

        super.init(nibName: nil, bundle: nil)
        self.listaMoedas = []
    }

    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        client.coinInfo { (response) in
            self.listaMoedas = response
            print(self.listaMoedas)
        }
        view.backgroundColor = .purple
    }
}
