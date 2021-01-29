//
//  CoinViewData.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 22/01/21.
//

import Foundation
import Commons

protocol CoinViewDataType {
    var name: String { get}
    var shortname: String { get }
    var price: String { get }
    var valueHour : String { get }
    var valueDay : String { get }
    var valueMonth : String { get }
    var idIcon: String { get }
    var isFav: Bool { get }
}

class CoinViewData : NSObject {
    private let model:CoinModelElement
    init(model: CoinModelElement) {
        self.model = model
    }
}

extension CoinViewData : CoinViewDataType {
    var valueHour: String {
        guard let preco = model.volume1HrsUsd?.currencyUS else { return ""}
        return String(describing: preco)
    }
    var valueDay: String {
        guard let preco = model.volume1DayUsd?.currencyUS else { return ""}
        return String(describing: preco)
    }
    var valueMonth: String {
        guard let preco = model.volume1MthUsd?.currencyUS else { return ""}
        return String(describing: preco)
    }
    var idIcon: String {
        guard let idIcon = model.idIcon else { return "" }
        let idIconFormatado = idIcon.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
        return idIconFormatado
    }
    var name: String {
            guard let name = model.name else { return ""}
            return name
    }
    var shortname: String {
        guard let shortname = model.assetID else { return ""}
        return shortname
    }
    var price: String {
        guard let preco = model.priceUsd?.currencyUS else { return ""}
        return String(describing: preco)
    }
    var isFav: Bool {
        return sharedFavorites.checkIfFavorite(assetId: shortname)
    }
}
