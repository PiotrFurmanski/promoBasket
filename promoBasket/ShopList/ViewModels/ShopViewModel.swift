//
//  ShopViewModel.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import Foundation


protocol ShopView: class {
    func reloadData()
}


class ShopViewModel {
    var shopItems = [ShopCellViewModel]()
    
    var numberOfRows: Int {
        return shopItems.count
    }
    
    private weak var shopView: ShopView?
    
    func setupData() {
        shopItems.append(ShopCellViewModel(item: ShopItem(price: 0.95, name: "Peas", quantity: "bag", amount: 0)))
        shopItems.append(ShopCellViewModel(item: ShopItem(price: 2.1, name: "Eggs", quantity: "dozen", amount: 0)))
        shopItems.append(ShopCellViewModel(item: ShopItem(price: 1.3, name: "Milk", quantity: "bottle", amount: 0)))
        shopItems.append(ShopCellViewModel(item: ShopItem(price: 0.73, name: "Beans", quantity: "can", amount: 0)))
    }
    
    func attach(view: ShopView) {
        self.shopView = view
    }
}
