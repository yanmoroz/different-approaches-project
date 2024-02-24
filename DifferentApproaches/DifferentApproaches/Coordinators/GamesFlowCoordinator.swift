//
//  GamesFlowCoordinator.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import UIKit

class GamesFlowCoordinator {
    
    var childCoordinators = [Coordinator]()
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
        navigationController.pushViewController(GamesListAssembly.gamesList(delegate: self), animated: true)
    }
    
    func showGameDetailsScene(game: Game) {
        navigationController.pushViewController(GameDetailsAssembly.gameDetails(game: game, delegate: self), animated: true)
    }
}

// MARK: - Coordinator
extension GamesFlowCoordinator: Coordinator {
    
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
