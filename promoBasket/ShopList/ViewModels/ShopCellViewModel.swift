//
//  ShopCellViewModel.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import Foundation

class ShopCellViewModel {
    
    private struct Constant {
        static let minAmount = Decimal(string: "0")!
        static let maxAmount = Decimal(string: "9999")!
    }
    
    var name: String {
        return shopItem.name
    }
    var price: String {
        return shopItem.price.description + " $"
    }
    var quantity: String {
        return shopItem.quantity
    }
    var amount: String {
        return shopItem.amount.description
    }
    
    var amountDecimal: Decimal {
        return shopItem.amount
    }
    
    var sum: String {
        return (NumberFormatter.currencyFormatter.string(from: sumDecimal as NSDecimalNumber) ?? "") + " $"
    }
    
    var sumDecimal: Decimal {
        return shopItem.amount * shopItem.price
    }
    
    private var shopItem: ShopItem
    
    init(item: ShopItem) {
        shopItem = item
    }
    
    @discardableResult func subtractProduct() -> String {
        guard shopItem.amount > Constant.minAmount else { return shopItem.amount.description }
        shopItem.amount -= 1
        return shopItem.amount.description
    }
    
    @discardableResult func addProduct() -> String {
        guard shopItem.amount < Constant.maxAmount else { return shopItem.amount.description }
        shopItem.amount += 1
        return shopItem.amount.description
    }
    
    func clearAmount() -> String {
        shopItem.amount = Decimal(string: "0")!
        return shopItem.amount.description
    }
    
    func update(amount: Decimal) {
        shopItem.amount = amount
    }
}

