//
//  ProjetoFinalTests.swift
//  ProjetoFinalTests
//
//  Created by Pedro Spim Costa on 21/01/21.
//

import XCTest
@testable import ProjetoFinal
@testable import Commons
@testable import detalhesBit

class ProjetoFinalTests: XCTestCase {
    var lista:CoinModel = []
    func testExample() throws {
        let lista: CoinModelElement
//        CoinListViewController().viewDidLoad()
//        DetalhesBitCoinViewController
        let client = MoedaAPI()
        client.coinInfo { (response) in
            self.lista = response
            XCTAssertEqual(self.lista[0].assetID, "BTC")
        }

    }
}
