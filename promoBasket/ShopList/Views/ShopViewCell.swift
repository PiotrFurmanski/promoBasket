//
//  ShopViewCell.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import UIKit

class ShopViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var amountTextField: UITextField! {
        didSet {
            amountTextField?.addDoneCancelToolbar(onDone: (target: self, action: #selector(doneButtonTapped)),
                                         onCancel: (target: self, action: #selector(cancelButtonTapped)))
        }
    }
    
    var viewModel: ShopCellViewModel?
    
    func setup(viewModel: ShopCellViewModel) {
        self.viewModel = viewModel
        name.text = viewModel.name
        price.text = viewModel.price
        quantity.text = viewModel.quantity
        amountTextField.text = viewModel.amount
        amountTextField.delegate = self
    }
    
    @IBAction func subtractProduct(_ sender: Any) {
        amountTextField.text = viewModel?.subtractProduct()
    }
    
    @IBAction func addProduct(_ sender: Any) {
        amountTextField.text = viewModel?.addProduct()
    }
    
    @objc func doneButtonTapped() {
        guard let text = amountTextField.text,
            text.first != "0",
            let amountDec = Decimal(string: text),
            amountDec >= 0
        else {
            amountTextField.text = viewModel?.clearAmount()
            amountTextField.resignFirstResponder()
            return
        }
        viewModel?.update(amount: amountDec)
        amountTextField.resignFirstResponder()
    }
    
    @objc func cancelButtonTapped() {
        amountTextField.text = viewModel?.amount
        amountTextField.resignFirstResponder()
    }
    
}

extension ShopViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        doneButtonTapped()
    }
}

