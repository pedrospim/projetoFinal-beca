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
    // private let client: FilmeAPIProtocol
    var viewData: Bindable<[CoinViewData]> = Bindable([])
    // MARK: - Constructors
    // init(client: FilmeAPIProtocol = FilmeAPI()) {
    //    self.client = client
    // }
    
    init(){
        loadCoins()
    }
    
    // MARK: - Methods
    func loadCoins() {
        coinInfo { (response) in
            for coin in response{
                self.viewData.value.append(CoinViewData(model: coin))
            }
        }
    }
    func coinInfo(completion: @escaping (CoinModel) -> Void) {
        let headers = ["X-CoinAPI-Key":"04D7059E-2345-4BDA-B196-DED63361DC49"]
        Alamofire.request("https://rest.coinapi.io/v1/assets", method: .get, headers: headers).responseJSON { (resposta) in
                    switch resposta.result {
                    case .success:

                        guard let jsonData = resposta.data else {return}
                        guard let coins = try? JSONDecoder().decode(CoinModel.self, from: jsonData) else {return}
                        completion(coins)

                    case .failure:
                        print(resposta.error!)
                        }
                    }
    }
}
