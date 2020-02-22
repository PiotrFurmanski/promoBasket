//
//  BasketViewMock.swift
//  promoBasketTests
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import Foundation
@testable import promoBasket

class BasketViewMock: BasketView {
    var dataReloaded = false
    func reloadData() {
        dataReloaded = true
    }
}

