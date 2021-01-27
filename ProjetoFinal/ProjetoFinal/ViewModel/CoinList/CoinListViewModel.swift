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
        client.coinInfo { (responseCoin) in
            self.client.imageInfo(tamanho: 16) { (responseImage) in
                for coin in responseCoin {
                    if let match = responseImage.first(where: { $0.assetID == coin.assetID }) {
                        guard let url = match.url else { return }
                            self.viewData.value.append(CoinViewData(model: coin,linkImage: url))
                        } else {
                            self.viewData.value.append(CoinViewData(model: coin,linkImage: "https://icons.iconarchive.com/icons/icons8/windows-8/256/Systems-Mac-Os-icon.png"))
                        }
                }
                // self.imagens.value.append(contentsOf: responseImage)
            }
        }
        
    }
}
