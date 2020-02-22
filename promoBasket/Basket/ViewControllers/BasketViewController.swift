//
//  BasketViewController.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController {

    private struct Constant {
        static let cellWidth = 80
        static let cellMargin = 10
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var actvityIndicator: UIActivityIndicatorView!
    
    var viewModel: BasketViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.attach(view: self)
        viewModel?.loadCurrencies()
        sumLabel.text = viewModel?.totalAmount
    }

}

extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel, let cell = tableView.dequeueReusableCell(withIdentifier:
            String(describing: BasketCell.self), for: indexPath) as? BasketCell else { return UITableViewCell() }
        cell.setup(viewModel: viewModel.selectedItems[indexPath.row])
        return cell
    }
}

extension BasketViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfCollectionRows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CurrencyCell.self),
                                                      for: indexPath) as? CurrencyCell
        cell?.setup(with: viewModel?.currencyPairModels[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

extension BasketViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let currencyModel = viewModel?.currencyPairModels[indexPath.row] else { return }
        if indexPath.row != viewModel?.selectedRow {
            viewModel?.selectedRow = indexPath.row
            sumLabel.text = viewModel?.calculateAmount(for: currencyModel)
        } else {
            viewModel?.selectedRow = nil
            sumLabel.text = viewModel?.totalAmount
            collectionView.reloadData()
        }
    }
}

extension BasketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        let totalCellWidth = Constant.cellWidth * collectionView.numberOfItems(inSection: 0)
        let totalSpacingWidth = Constant.cellMargin * (collectionView.numberOfItems(inSection: 0) - 1)

        let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset

        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(Constant.cellWidth), height: collectionView.bounds.height)
    }
}

extension BasketViewController: BasketView {
    func reloadData() {
        collectionView.reloadData()
        actvityIndicator.stopAnimating()
    }
}

