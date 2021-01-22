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
    // MARK: - Methods
    func loadCoins() {
        coinInfo { (response) in
            for coin in response{
                self.viewData.value.append(CoinViewData(model: coin))
            }
        }
    }
    func coinInfo(completion: @escaping (CoinModel) -> Void) {
                Alamofire.request("https://d15da3a1-1ea2-4c67-9fe3-94e08f88eed2.mock.pstmn.io/BTC_get", method: .get).responseJSON { (resposta) in
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
