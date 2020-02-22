//
//  CurrencyPairModel.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import Foundation

struct CurrencyPairModel {
    var pairName: String
    var ratio: Decimal
    
    var currencyName: String {
        return String(pairName.dropFirst(3))
    }
}

