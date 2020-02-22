//
//  ShopCellViewModelTests.swift
//  promoBasketTests
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import XCTest
@testable import promoBasket

class ShopCellViewMmodelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testShouldCalculateAmountProperly() {
        let shopCellViewModelUnderTest = ShopCellViewModel(item: ShopItem(price: Decimal(string: "1.1")!,
                                                                          name: "Chocolate",
                                                                          quantity: "bar", amount: 2))

        XCTAssertEqual(shopCellViewModelUnderTest.amount, "2")
        shopCellViewModelUnderTest.subtractProduct()
        XCTAssertEqual(shopCellViewModelUnderTest.amount, "1")
        shopCellViewModelUnderTest.subtractProduct()
        XCTAssertEqual(shopCellViewModelUnderTest.amount, "0")
        shopCellViewModelUnderTest.subtractProduct()
        XCTAssertEqual(shopCellViewModelUnderTest.amount, "0")
        shopCellViewModelUnderTest.addProduct()
        XCTAssertEqual(shopCellViewModelUnderTest.amount, "1")
        shopCellViewModelUnderTest.addProduct()
        XCTAssertEqual(shopCellViewModelUnderTest.amount, "2")
        XCTAssertEqual(shopCellViewModelUnderTest.sum, "2.20 $")
        
    }
    
    func testShouldCalculateAmountProperlyForMax() {
        let shopCellViewModelUnderTest = ShopCellViewModel(item: ShopItem(price: Decimal(string: "1.1")!,
                                                                          name: "Chocolate",
                                                                          quantity: "bar", amount: 9998))
        XCTAssertEqual(shopCellViewModelUnderTest.amount, "9998")
        shopCellViewModelUnderTest.addProduct()
        XCTAssertEqual(shopCellViewModelUnderTest.amount, "9999")
        shopCellViewModelUnderTest.addProduct()
        XCTAssertEqual(shopCellViewModelUnderTest.amount, "9999")
        XCTAssertEqual(shopCellViewModelUnderTest.sum, "10,998.90 $")
    }
    
}
