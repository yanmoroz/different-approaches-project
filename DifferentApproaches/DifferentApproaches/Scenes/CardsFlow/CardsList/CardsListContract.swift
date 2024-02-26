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
    func toggleLoadingIndicator(visible: Bool)
}

protocol CardsListPresentation {
    func viewDidLoad()
    func searchQueryDidChange(_ query: String)
}

protocol CardsListSceneDelegate: AnyObject {
    func didSelectCard(_ card: Card)
}
