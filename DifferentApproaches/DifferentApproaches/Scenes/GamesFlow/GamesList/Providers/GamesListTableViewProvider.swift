//
//  GamesListTableViewProvider.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import UIKit

final class GamesListTableViewProvider: NSObject {
    var games: [Game] = []
    weak var delegate: GamesListTableViewProviderDelegate?
}

// MARK: - GamesListTableViewProviderDelegate
protocol GamesListTableViewProviderDelegate: AnyObject {
    func didSelectGame(at index: Int)
}

// MARK: - UITableViewDataSource
extension GamesListTableViewProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(ofType: GameTableViewCell.self, for: indexPath) else {
            return UITableViewCell()
        }
        
        let viewModel = games[indexPath.row]
        cell.setTitle(viewModel.title, genre: viewModel.genre)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension GamesListTableViewProvider: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectGame(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
