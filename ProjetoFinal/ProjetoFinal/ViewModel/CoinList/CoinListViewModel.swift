//
//  CoinListViewModel.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 22/01/21.
//

import Foundation
import Alamofire

class CoinListViewModel {
    // MARK: - Properts
    private let client: MoedaAPI
    var viewData: Bindable<[CoinViewData]> = Bindable([])
    var imagens: Bindable<ImageModel> = Bindable([])
    // MARK: - Constructors
    // init(client: FilmeAPIProtocol = FilmeAPI()) {
    //
    // }
    init(client:MoedaAPI = MoedaAPI()) {
        self.client = client
        self.loadCoins()
    }
    // MARK: - Methods
    func loadCoins() {
        client.coinInfo { (response) in
            for coin in response {
                self.viewData.value.append(CoinViewData(model: coin))
            }
        }
        client.imageInfo(tamanho: 16) { (response) in
            self.imagens.value.append(contentsOf: response)
        }
    }
}
