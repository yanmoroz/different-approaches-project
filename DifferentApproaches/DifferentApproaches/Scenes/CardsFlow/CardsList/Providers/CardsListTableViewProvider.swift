//
//  CardsListTableViewProvider.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import UIKit

final class CardsListTableViewProvider: NSObject {
    
    var cards: [Card] = []
    weak var delegate: CardsListTableViewProviderDelegate?
}

// MARK: - CardsListTableViewProviderDelegate
protocol CardsListTableViewProviderDelegate: AnyObject {
    func didSelectCard(at index: Int)
}

// MARK: - UITableViewDataSource
extension CardsListTableViewProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(ofType: CardTableViewCell.self, for: indexPath) else {
            return UITableViewCell()
        }
        
        let viewModel = cards[indexPath.row]
        cell.setTitle(viewModel.name, manaCost: viewModel.manaCost)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CardsListTableViewProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectCard(at: indexPath.row)
    }
}
