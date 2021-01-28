//
//  UIImageView.swift
//  Commons
//
//  Created by Lucas Abdel Leitao on 28/01/21.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {

    public func carregarImagem(idIcon: String) {
        let url = "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_64/\(idIcon).png"
        guard let imageurl = URL(string: url) else {return}
        self.af_setImage(withURL: imageurl)
    }
}
