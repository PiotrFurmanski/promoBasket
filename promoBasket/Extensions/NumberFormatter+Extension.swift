//
//  NumberFormatter+Extension.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static var currencyFormatter: NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = ""
        currencyFormatter.locale = Locale.current
        return currencyFormatter
    }
}
