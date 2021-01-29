//
//  Accessibility.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 29/01/21.
//

import UIKit
extension CoinTableViewCell {

    func setupAcessibilityCell() {
        priceLabel.font = .preferredFont(forTextStyle: .body)
        priceLabel.adjustsFontForContentSizeCategory = true

        nameCoinLabel.font = .preferredFont(forTextStyle: .body)
        nameCoinLabel.adjustsFontForContentSizeCategory = true

        shortnameCoinLabel.font = .preferredFont(forTextStyle: .body)
        shortnameCoinLabel.adjustsFontForContentSizeCategory = true

        coinImage.accessibilityTraits = .image
        coinImage.accessibilityLabel = ""

    }
}

extension CoinListViewController {

    func setupAcessibilityView() {
        dateLabel.font = .preferredFont(forTextStyle: .body)
        dateLabel.adjustsFontForContentSizeCategory = true

        titleLabel.font = .preferredFont(forTextStyle: .body)
        titleLabel.adjustsFontForContentSizeCategory = true
    }
}
