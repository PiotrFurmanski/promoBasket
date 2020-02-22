//
//  CurrencyServiceMock.swift
//  promoBasketTests
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import Foundation
@testable import promoBasket

class CurrencyServiceMock: CurrencyServiceProtocol {
    func loadCurrencyRates(completion: @escaping ([String: CurrencyPair]?, Error?) -> ()) {
        let currencyPairs = ["USDEUR": CurrencyPair(rate: Decimal(string: "0.88")!, timestamp: Decimal.nan),
                             "USDGBP": CurrencyPair(rate: Decimal(string: "0.76")!, timestamp: Decimal.nan),
                             "USDPLN": CurrencyPair(rate: Decimal(string: "3.81")!, timestamp: Decimal.nan)]
        completion(currencyPairs, nil)
    }

}

