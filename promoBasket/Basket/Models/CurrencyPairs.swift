//
//  CurrencyPairs.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import Foundation

struct CurrencyResponse: Codable {
    var rates: [String: CurrencyPair]
}

struct CurrencyPair: Codable {
    var rate: Decimal
    var timestamp: Decimal
}

