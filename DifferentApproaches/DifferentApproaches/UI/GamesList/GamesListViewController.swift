//
//  GamesListViewController.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import UIKit

final class GamesListViewController: UIViewController {
    
    private lazy var customView = view as! GamesListView
    var presenter: GamesListPresentation!
    
    override func loadView() {
        view = GamesListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension GamesListViewController: GamesListViewInterface {
 
    func reloadData() {
        customView.reloadTableView()
    }
    
    func setTableViewProvider(_ provider: TableViewProvider) {
        customView.setTableViewProvider(provider)
    }
}
