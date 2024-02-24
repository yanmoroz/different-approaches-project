//
//  CardsListViewController.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import UIKit

final class CardsListViewController: UIViewController {
    
    var presenter: CardsListPresentation?
    private lazy var customView = view as? CardsListView
    
    override func loadView() {
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    private struct Locals {
        static let title = "Cards"
    }
}

// MARK: - Private Methods
private extension CardsListViewController {
    
    func setupUI() {
        view = CardsListView()
        title = Locals.title
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
