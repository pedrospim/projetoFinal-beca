//
//  MoedaAPI.swift
//  ProjetoFinal
//
//  Created by Lucas Abdel Leitao on 22/01/21.
//

import UIKit
import Alamofire

enum HTTPResponse {
    case valid
    case error(statusCode: Int)
}

class MoedaAPI {
    // MARK: - Get Moedas
    func coinInfo(url: String = "https://rest-sandbox.coinapi.io/v1/assets/?apikey=04D7059E-2345-4BDA-B196-DED63361DC49", completion: @escaping (CoinModel) -> Void) {
        Alamofire.request(url, method: .get).responseJSON { (resposta) in
            switch resposta.result {
            case .success:

                guard let jsonData = resposta.data else {return}
                guard let coins = try? JSONDecoder().decode(CoinModel.self, from: jsonData) else {
                    self.alerta(message: "Bad Request -- There is something wrong with your request")
                    return
                    }

                completion(coins)

            case .failure(let error):
                let message: String
                if let httpStatusCode = resposta.response?.statusCode {

                    switch (httpStatusCode) {
                    case 400:
                        message = "Bad Request -- There is something wrong with your request"
                        self.alerta(message: message)
                    case 401:
                        message = "Unauthorized -- Your API key is wrong"
                        self.alerta(message: message)
                    case 403:
                        message = "Forbidden -- Your API key doesnt't have enough privileges to access this resource"
                        self.alerta(message: message)
                    case 429:
                        message = "Too many requests -- You have exceeded your API key rate limits"
                        self.alerta(message: message)
                    case 550:
                        message = "No data -- You requested specific single item that we don't have at this moment."
                        self.alerta(message: message)
                    default:
                        print(error.localizedDescription)
                    }
                } else {
                    message = error.localizedDescription
//                    message = "Connection offline"
                    self.alerta(message: message)
                }
                // Alerta Aqui
            }
        }
    }
    func alerta(message:String) {
        let viewController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        let alert = UIAlertController(title: "Alerta", message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
        return self.coinInfo { (response) in
            response
        }
    }
}
