//
//  GamesFlowCoordinator.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import UIKit

final class GamesFlowCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var delegate: GamesFlowCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - GamesFlowCoordinatorDelegate
protocol GamesFlowCoordinatorDelegate: AnyObject {
}

// MARK: - Private Methods
private extension GamesFlowCoordinator {
    func showGamesListScene() {
        let gamesListVC = GamesListAssembly.gamesList(delegate: self)
        navigationController.pushViewController(gamesListVC, animated: true)
    }
    
    func showGameDetailsScene(game: Game) {
        let gameDetailsVC = GameDetailsAssembly.gameDetails(game: game, delegate: self)
        navigationController.pushViewController(gameDetailsVC, animated: true)
    }
}

// MARK: - Coordinator
extension GamesFlowCoordinator {
    func start() {
        showGamesListScene()
    }
}

// MARK: - GamesListSceneDelegate
extension GamesFlowCoordinator: GamesListSceneDelegate {
    func didSelectGame(_ game: Game) {
        showGameDetailsScene(game: game)
    }
}

// MARK: - GameDetailsSceneDelegate
extension GamesFlowCoordinator: GameDetailsSceneDelegate {
}
