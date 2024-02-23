//
//  GamesFlowCoordinator.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import UIKit

// TODO: MOVE?
protocol GamesFlowCoordinatorDelegate: AnyObject {
    
}

// MARK: - GamesFlowCoordinator
class GamesFlowCoordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var delegate: GamesFlowCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - Private Methods
private extension GamesFlowCoordinator {
    
    func showGamesListScene() {
        navigationController.pushViewController(GamesListAssembly.gamesList(delegate: self), animated: true)
    }
    
    func showGameDetailsScene(gameId: Game.ID) {
        navigationController.pushViewController(GameDetailsAssembly.gameDetails(gameId: gameId, delegate: self), animated: true)
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
        showGameDetailsScene(gameId: game.id)
    }
}

// MARK: - GameDetailsSceneDelegate
extension GamesFlowCoordinator: GameDetailsSceneDelegate {
    
}
