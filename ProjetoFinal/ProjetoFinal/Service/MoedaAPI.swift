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
    var listaImagens: ImageModel = []

    // MARK: - Get Moedas
    func coinInfo(url: String = "https://6bb67689-21ec-4ba0-ad09-67d21f258f2b.mock.pstmn.io//BTC_GET_200", completion: @escaping (CoinModel) -> Void) {
        Alamofire.request(url, method: .get).responseJSON { (resposta) in
            switch resposta.result {
            case .success:

                guard let jsonData = resposta.data else {return}
                guard let coins = try? JSONDecoder().decode(CoinModel.self, from: jsonData) else {return}

                completion(coins)

            case .failure(let error):
                let message: String
                if let httpStatusCode = resposta.response?.statusCode {

                    switch (httpStatusCode) {
                    case 400:
                        message = "Bad Request -- There is something wrong with your request"
                        print(message)
                        let viewController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
                        let alert = UIAlertController(title: "Alerta", message: "\(message)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        viewController.present(alert, animated: true, completion: nil)
                        return self.coinInfo { (response) in
                            response
                        }
                    case 401:
                        message = "Unauthorized -- Your API key is wrong"
                        print(message)
                        let viewController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
                        let alert = UIAlertController(title: "Alerta", message: "\(message)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        viewController.present(alert, animated: true, completion: nil)
                        return self.coinInfo { (response) in
                            response
                        }
                    case 403:
                        message = "Forbidden -- Your API key doesnt't have enough privileges to access this resource"
                        print(message)
                        let viewController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
                        let alert = UIAlertController(title: "Alerta", message: "\(message)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        viewController.present(alert, animated: true, completion: nil)
                        return self.coinInfo { (response) in
                            response
                        }
                    case 429:
                        message = "Too many requests -- You have exceeded your API key rate limits"
                        print(message)
                        let viewController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
                        let alert = UIAlertController(title: "Alerta", message: "\(message)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        viewController.present(alert, animated: true, completion: nil)
                        return self.coinInfo { (response) in
                            response
                        }
                    case 550:
                        message = "No data -- You requested specific single item that we don't have at this moment."
                        print(message)
                        let viewController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
                        let alert = UIAlertController(title: "Alerta", message: "\(message)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        viewController.present(alert, animated: true, completion: nil)
                        return self.coinInfo { (response) in
                            response
                        }
                    default:
                        print(error.localizedDescription)
                    }
                } else {
                    message = error.localizedDescription
//                    message = "Connection offline"
                    print(message)
                    let viewController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
                    let alert = UIAlertController(title: "Alerta", message: "\(message)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    viewController.present(alert, animated: true, completion: nil)
                    return self.coinInfo { (response) in
                        response
                    }
                }
                // Alerta Aqui
            }
        }
    }
    // MARK: - Get Image
    func imageInfo(tamanho: Int, completion: @escaping (ImageModel) -> Void) {
        let key = "04D7059E-2345-4BDA-B196-DED63361DC49"
        Alamofire.request("https://rest-sandbox.coinapi.io/v1/assets/icons/\(tamanho)/?apikey=\(key)", method: .get).responseJSON { (resposta) in
            switch resposta.result {
            case .success:

                guard let jsonData = resposta.data else {return}
                guard let jsonImagem = try? JSONDecoder().decode(ImageModel.self, from: jsonData) else {return}

                completion(jsonImagem)
                // Chamar quando for colocar imagem na celula

            case .failure:
                print(resposta)
            }
        }
    }

}
