//
//  GamesListContract.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

protocol GamesListPresentation {
    func viewDidLoad()
}

protocol GamesListViewInterface: AnyObject {
    func reloadData()
    func setTableViewProvider(_ provider: TableViewProvider)
}
