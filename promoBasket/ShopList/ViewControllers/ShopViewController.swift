//
//  ShopViewController.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ShopViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.attach(view: self)
        viewModel.setupData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVc = segue.destination as? BasketViewController {
            destVc.viewModel = BasketViewModel(service: CurrencyService(),
                                               shopItems: viewModel.shopItems)
        }
    }

}

extension ShopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ShopViewCell.self), for: indexPath) as? ShopViewCell else { return UITableViewCell() }
        cell.setup(viewModel: viewModel.shopItems[indexPath.row])
        return cell
    }
}

extension ShopViewController: ShopView {
    func reloadData() {
        tableView.reloadData()
    }
}

