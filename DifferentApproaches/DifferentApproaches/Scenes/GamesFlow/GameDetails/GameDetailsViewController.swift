//
//  GameDetailsViewController.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import UIKit

final class GameDetailsViewController: UIViewController {
    
    private lazy var customView = view as? GameDetailsView
    var presenter: GameDetailsPresentation?
    
    override func loadView() {
        view = GameDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: - GameDetailsViewInterface
extension GameDetailsViewController: GameDetailsViewInterface {
    
    func setupUI(with game: Game) {
        title = game.title
    }
    
    func updateUI(with game: GameDetails?) {
        customView?.update(with: game)
    }
}
