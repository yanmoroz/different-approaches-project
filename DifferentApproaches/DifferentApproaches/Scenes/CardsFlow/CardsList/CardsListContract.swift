//
//  CardsListContract.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import UIKit

protocol CardsListViewInterface: ViewInterface {
    func reloadData()
    func setTableViewProvider(_ provider: UITableViewDataSource & UITableViewDelegate)
}

protocol CardsListPresentation {
    func viewDidLoad()
}

protocol CardsListSceneDelegate: AnyObject {
    func didSelectCard(_ card: Card)
}

