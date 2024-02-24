//
//  GamesListContract.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import UIKit

protocol GamesListViewInterface: ViewInterface {
    func reloadData()
    func setTableViewProvider(_ provider: UITableViewDataSource & UITableViewDelegate)
    func toggleLoadingIndicator(visible: Bool)
}

protocol GamesListPresentation {
    func viewDidLoad()
    func searchQueryDidChange(_ query: String)
}

protocol GamesListSceneDelegate: AnyObject {
    func didSelectGame(_ game: Game)
}
