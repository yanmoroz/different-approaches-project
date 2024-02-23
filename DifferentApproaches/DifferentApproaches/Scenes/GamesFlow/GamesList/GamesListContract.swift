//
//  GamesListContract.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

protocol GamesListViewInterface: ViewInterface {
    func reloadData()
    func setTableViewProvider(_ provider: TableViewProvider)
}

protocol GamesListPresentation {
    func viewDidLoad()
}
