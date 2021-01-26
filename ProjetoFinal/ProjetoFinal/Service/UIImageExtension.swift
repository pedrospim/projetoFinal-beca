//
//  UIImageExtension.swift
//  ProjetoFinal
//
//  Created by Lucas Abdel Leitao on 26/01/21.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {

    func carregarImagem(url: String) {

        guard let imageurl = URL(string: url) else {return}
        Alamofire.request(imageurl).responseImage { (response) in
            if let image = response.result.value {
                    self.image = image
            }
        }
    }
}
