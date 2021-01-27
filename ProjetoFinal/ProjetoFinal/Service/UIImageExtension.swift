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

    func carregarImagem(idIcon: String) {
        let url = "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_64/\(idIcon).png"

        guard let imageurl = URL(string: url) else {return}
        Alamofire.request(imageurl).responseImage { (response) in
            if let image = response.result.value {
                DispatchQueue.main.async {
                   self.image = image
                }
            }
        }
    }
}
