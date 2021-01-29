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
    private var coinList:[CoinViewData] = []
    var viewData: Bindable<[CoinViewData]> = Bindable([])
    var imagens: Bindable<ImageModel> = Bindable([])
    
    // MARK: - Constructors
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
            self.coinList = self.viewData.value
        }
    }
    func filterResults(_ searchText:String){
        var listaNova = coinList
        if searchText != ""{
            listaNova = listaNova.filter({ (coin) -> Bool in
                if coin.name.contains(searchText){
                    return true
                }else {
                    return false
                }
            })
            
        }
        self.viewData.value = listaNova
    }

}
