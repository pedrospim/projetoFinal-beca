//
//  CoinListViewModel.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 22/01/21.
//

import Foundation

class CoinListViewModel {
    // MARK: - Properts
    // private let client: FilmeAPIProtocol
    var viewData: Bindable<[CoinViewData]?> = Bindable([])
    // MARK: - Constructors
    // init(client: FilmeAPIProtocol = FilmeAPI()) {
    //    self.client = client
    // }
    // MARK: - Methods
    func loadCoins() {
        }
}
