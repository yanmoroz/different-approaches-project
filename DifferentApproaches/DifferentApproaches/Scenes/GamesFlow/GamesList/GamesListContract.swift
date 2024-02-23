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
}

protocol GamesListPresentation {
    func viewDidLoad()
}

protocol GamesListSceneDelegate: AnyObject {
    func didSelectGame(_ game: Game)
}
