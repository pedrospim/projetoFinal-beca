//
//  MoedaAPI.swift
//  ProjetoFinal
//
//  Created by Lucas Abdel Leitao on 22/01/21.
//

import Foundation
import Alamofire

class MoedaAPI {

    // MARK: - Get
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
