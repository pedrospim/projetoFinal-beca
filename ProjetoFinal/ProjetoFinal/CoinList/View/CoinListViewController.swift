//
//  ViewController.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 21/01/21.
//

import UIKit
import Commons
import detalhesBit

class CoinListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    // MARK: - Outlets
    @IBOutlet weak var coinTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: - Variables
    let viewModel: CoinListViewModel = CoinListViewModel()
    // MARK: - Inicializacao
    init() {
        super.init(nibName: "CoinListViewController", bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        setupSearchBar()
        bind()
    }
    public override func viewDidAppear(_ animated: Bool) {
        coinTableView.reloadData()
    }    
    // MARK: - Funcoes de Inicializacao
    func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func setupSearchBar() {
        searchBar.delegate = self
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterResults(searchText)
        coinTableView.reloadData()
    }
    func setupTableView() {
        coinTableView.dataSource = self
        coinTableView.delegate = self
        coinTableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "coinCell")
        let tableViewLoadingCellNib = UINib(nibName: "LoadingCell", bundle: nil)
            coinTableView.register(tableViewLoadingCellNib, forCellReuseIdentifier: "loadingCell")
    }
    func bind() {
        viewModel.viewData.bind { (_) in
            self.coinTableView.reloadData()
        }
        viewModel.imagens.bind { (_) in
            self.coinTableView.reloadData()
        }
    }
    // MARK: - Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    // MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.viewData.value.count
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as? CoinTableViewCell else {
            fatalError("The dequeued cell is not an instance of celulaMoeda.")
        }
        cell.setup(viewModel: CoinTableViewCellModel(coin: viewModel.viewData.value[indexPath.row]))
        return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as? LoadingCell else {
                fatalError("The dequeued cell is not an instance of celulaMoeda.")
            }
            if viewModel.viewData.value.count < 1 {
                cell.activityIndicator.startAnimating()
            } else {
                cell.activityIndicator.stopAnimating()
                cell.activityIndicator.isHidden = true
            }
            return cell
        }
    }
    // MARK: - TableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coin = viewModel.viewData.value[indexPath.row]
        let controller = DetalhesBitCoinViewController(coin.shortname, coin.price, coin.shortname, coin.valueHour, coin.valueMonth, coin.valueDay, coin.idIcon, sharedFavorites.checkIfFavorite(assetId: coin.shortname))
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
