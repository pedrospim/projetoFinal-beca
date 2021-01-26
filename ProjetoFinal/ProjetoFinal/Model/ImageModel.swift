//
//  ImageModel.swift
//  ProjetoFinal
//
//  Created by Lucas Abdel Leitao on 22/01/21.
//

import Foundation

// MARK: - ImageModelElement
struct ImageModelElement: Codable {
    let assetID: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case url
    }
}

typealias ImageModel = [ImageModelElement]
