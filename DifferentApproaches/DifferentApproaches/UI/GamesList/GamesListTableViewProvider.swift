//
//  GamesListTableViewProvider.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import UIKit

protocol GamesListTableViewProviderDelegate: AnyObject {
    func didSelectGame(at index: Int)
}

final class GamesListTableViewProvider: NSObject, TableViewProvider {
    
    var games = [Game]()
    weak var delegate: GamesListTableViewProviderDelegate?
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectGame(at: indexPath.row)
    }
}
