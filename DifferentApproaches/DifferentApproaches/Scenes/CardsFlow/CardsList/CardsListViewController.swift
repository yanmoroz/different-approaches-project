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

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = Locals.searchBarPlaceholder
        searchController.searchResultsUpdater = self
        return searchController
    }()

    override func loadView() {
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    private enum Locals {
        static let title = "Cards"
        static let searchBarPlaceholder = "Find a card..."
    }
}

// MARK: - Private Methods
private extension CardsListViewController {
    func setupUI() {
        view = CardsListView()
        title = Locals.title
        navigationItem.searchController = searchController
    }
}

// MARK: - UISearchResultsUpdating
extension CardsListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        presenter?.searchQueryDidChange(text)
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

    func toggleLoadingIndicator(visible: Bool) {
        customView?.toggleLoadingIndicator(visible: visible)
    }
}
