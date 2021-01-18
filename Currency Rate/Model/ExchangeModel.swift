//
//  ExchangeModel.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 17/01/2021.
//

import Foundation

struct ExchangeModel: Decodable {
    let table: String
    let no: String
    let effectiveDate: String
    let rates: [Rate]
}

struct Rate: Decodable {
    let currency: String
    let code: String
    let mid: Double
}
