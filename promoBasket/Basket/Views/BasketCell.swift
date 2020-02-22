//
//  BasketCell.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import UIKit

class BasketCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    var presenter: ShopCellViewModel?
    
    func setup(viewModel: ShopCellViewModel) {
        name.text = viewModel.name
        price.text = viewModel.sum
        quantity.text = viewModel.amount
    }

}

