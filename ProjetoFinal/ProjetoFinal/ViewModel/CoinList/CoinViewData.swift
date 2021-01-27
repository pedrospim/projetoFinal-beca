//
//  CoinViewData.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 22/01/21.
//

import Foundation

protocol CoinViewDataType {
    var name: String { get}
    var shortname: String { get }
    var price: String { get }
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
        guard let preco = model.priceUsd else { return ""}
        return String(describing: preco)
    }
    var isFav: Bool {
        guard let favorites = UserDefaults.standard.array(forKey: "favorites") as? [String] else { return false}
        if favorites.contains(shortname) {
            return true
        }
        return false
    }
}
