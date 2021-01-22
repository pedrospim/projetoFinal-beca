//
//  CoinViewData.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 22/01/21.
//

import Foundation

protocol CoinViewDataType {
    var name: String { get }
    var shortname: String { get }
    var price: String { get }
}

class CoinViewData : NSObject {
    private let model:CoinModelElement
    init(model: CoinModelElement) {
        self.model = model
    }
}

extension CoinViewData : CoinViewDataType {
    var name: String {
        return model.name
    }
    var shortname: String {
        return model.assetID
    }
    var price: String {
        return String(describing: model.priceUsd) 
    }
}
