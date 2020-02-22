//
//  CurrencyCell.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import UIKit

class CurrencyCell: UICollectionViewCell {
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var highlightView: UIView!
    
    func setup(with currency: CurrencyPairModel?) {
        currencyName.text = currency?.currencyName
        highlightView.isHidden = true
    }
    
    override var isSelected: Bool {
        didSet {
            highlightView.isHidden = !isSelected
        }
    }
}

