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
        guard let name = model.name else { return ""}
        return name
    }
    var shortname: String {
        guard let shortname = model.assetID else { return ""}
        return shortname
    }
    var price: String {
        guard let preco = model.priceUsd else { return ""}
        return String(describing: preco)
    }
}
