//
//  GamesListViewController.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import UIKit

final class GamesListViewController: UIViewController {
    
    var presenter: GamesListPresentation?
    
    private lazy var customView = view as? GamesListView
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Find a game..." // TODO:
        searchController.searchBar.isHidden = false
        searchController.searchResultsUpdater = self
        return searchController
    }()
    
    override func loadView() {
        view = GamesListView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: Private Methods
private extension GamesListViewController {
    
    private func setupUI() {
        title = "Games" // TODO:
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
}

// MARK: - UISearchResultsUpdating
extension GamesListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        presenter?.searchQueryDidChange(text)
    }
    
}

// MARK: - GamesListViewInterface
extension GamesListViewController: GamesListViewInterface {
    
    func reloadData() {
        customView?.reloadTableView()
    }
    
    func setTableViewProvider(_ provider: UITableViewDataSource & UITableViewDelegate) {
        customView?.setTableViewProvider(provider)
    }
}
