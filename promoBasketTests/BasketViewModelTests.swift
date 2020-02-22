//
//  BasketViewModelTests.swift
//  promoBasketTests
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import XCTest
@testable import promoBasket

class BasketViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testShouldSetThreeCurrencyPairs() {
        
        let expect = expectation(description: "Waiting response")
        let basketView = BasketViewMock()
        let basketViewModelUnderTest = BasketViewModel(service: CurrencyServiceMock(), shopItems: [ShopCellViewModel]())
        basketViewModelUnderTest.attach(view: basketView)
        
        basketViewModelUnderTest.loadCurrencies() {
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(basketView.dataReloaded)
        XCTAssertEqual(basketViewModelUnderTest.numberOfCollectionRows, 3)
    }
    
    func testShouldSetProperlySelectedItems() {
        let shopItems = [ShopCellViewModel(item: ShopItem(price: 1000.0, name: "Tv", quantity: "", amount: 1)),
                         ShopCellViewModel(item: ShopItem(price: 500.0, name: "Ipone", quantity: "", amount: 0)),
                         ShopCellViewModel(item: ShopItem(price: 499.0, name: "PS5", quantity: "", amount: 2))]
        let basketViewModelUnderTest = BasketViewModel(service: CurrencyServiceMock(), shopItems: shopItems)
        
        XCTAssertEqual(basketViewModelUnderTest.numberOfRows, 2)
        XCTAssertEqual(basketViewModelUnderTest.totalAmount, "Total amount: 1,998.00 $")
    }
    
    func testShouldProperlyCalculateCurrencyPair() {
        let shopItems = [ShopCellViewModel(item: ShopItem(price: 1000.0, name: "Tv", quantity: "", amount: 1)),
                         ShopCellViewModel(item: ShopItem(price: 500.0, name: "Ipone", quantity: "", amount: 0)),
                         ShopCellViewModel(item: ShopItem(price: 499.0, name: "PS5", quantity: "", amount: 2))]
        let basketViewModelUnderTest = BasketViewModel(service: CurrencyServiceMock(), shopItems: shopItems)
        
        XCTAssertEqual(basketViewModelUnderTest.numberOfRows, 2)
        XCTAssertEqual(basketViewModelUnderTest.totalAmount, "Total amount: 1,998.00 $")
        let currencyPair = CurrencyPairModel(pairName: "USDGBP", ratio: Decimal(string: "0.76")!)
        XCTAssertEqual(basketViewModelUnderTest.calculateAmount(for: currencyPair), "Total amount: 1,518.48 GBP")
    }
    
}

