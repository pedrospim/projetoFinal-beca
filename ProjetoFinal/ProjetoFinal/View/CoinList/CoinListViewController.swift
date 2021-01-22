//
//  ViewController.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 21/01/21.
//

import UIKit

class CoinListViewController: UIViewController, UITableViewDataSource {
    // MARK: - Outlets
    @IBOutlet weak var coinTableView: UITableView!
    // MARK: - Variables
    let viewModel: CoinListViewModel = CoinListViewModel()
    var coinList: [CoinViewData] = []
    // MARK: - Inicializacao
    init() {
        super.init(nibName: "CoinListViewController", bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        coinTableView.dataSource = self
        bind()
        viewModel.loadCoins()
    }
    func bind() {
        viewModel.viewData.bind { (response) in
           // guard let `response` = response else { return }
            self.coinList  = response
            self.coinTableView.reloadData()
        }
    }
    // MARK: - Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    // MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "coinCell")
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "coinCell") as? CoinTableViewCell else {
            fatalError("The dequeued cell is not an instance of celulaMoeda.")
        }
        celula.viewModel = CoinTableViewCellModel(coin: coinList[indexPath.row])
        celula.bind()
        return celula
    }
}
