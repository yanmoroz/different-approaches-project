//
//  CardsListViewController.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import UIKit

final class CardsListViewController: UIViewController {
    
    private lazy var customView = view as? CardsListView
    var presenter: CardsListPresentation?
    
    override func loadView() {
        view = CardsListView()
        title = "Cards" // TODO:
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: - CardsListViewInterface
extension CardsListViewController: CardsListViewInterface {
 
    func reloadData() {
        customView?.reloadTableView()
    }
    
    func setTableViewProvider(_ provider: UITableViewDataSource & UITableViewDelegate) {
        customView?.setTableViewProvider(provider)
    }
}
