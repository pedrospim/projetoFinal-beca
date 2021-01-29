//
//  CoinTableViewCellModel.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 22/01/21.
//

import Foundation

class CoinTableViewCellModel {
    // MARK: - Properts
    var viewData: Bindable<CoinViewData?> = Bindable(nil)
    // MARK: - Constructors
    init(coin: CoinViewData) {
        self.viewData.value = coin
    }
}
