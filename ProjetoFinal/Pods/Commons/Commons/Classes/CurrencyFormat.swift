//
//  CurrencyFormat.swift
//  Commons
//
//  Created by Lucas Abdel Leitao on 21/01/21.
//

import Foundation

public extension Locale {
    static let br = Locale(identifier: "pt_BR")
    static let us = Locale(identifier: "en_US")
    static let uk = Locale(identifier: "en_GB")
}

public extension NumberFormatter {
    convenience init(style: Style, locale: Locale = .current) {
        self.init()
        self.locale = locale
        numberStyle = style
    }
}

public extension Formatter {
    static let currency = NumberFormatter(style: .currency)
    static let currencyUS = NumberFormatter(style: .currency, locale: .us)
    static let currencyBR = NumberFormatter(style: .currency, locale: .br)
    static let currencyUK = NumberFormatter(style: .currency, locale: .uk)
}

public extension Numeric {
    var currency: String { Formatter.currency.string(for: self) ?? "" }
    var currencyUS: String { Formatter.currencyUS.string(for: self) ?? "" }
    var currencyBR: String { Formatter.currencyBR.string(for: self) ?? "" }
    var currencyUK: String { Formatter.currencyUK.string(for: self) ?? "" }
}


