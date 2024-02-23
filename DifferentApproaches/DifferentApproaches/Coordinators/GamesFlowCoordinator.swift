//
//  GamesFlowCoordinator.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import UIKit


protocol GamesFlowCoordinatorDelegate: AnyObject {
    
}

class GamesFlowCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var delegate: GamesFlowCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

private extension GamesFlowCoordinator {
    
    func showGamesListScene() {
        navigationController.pushViewController(GamesListAssembly.gamesList(delegate: self), animated: true)
    }
    
    func showGameDetailsScene(gameId: Game.ID) {
        navigationController.pushViewController(GameDetailsAssembly.gameDetails(gameId: gameId, delegate: self), animated: true)
    }
}

extension GamesFlowCoordinator {
    
    func start() {
        showGamesListScene()
    }
}

extension GamesFlowCoordinator: GamesListSceneDelegate {
    
    func didSelectGame(_ game: Game) {
        showGameDetailsScene(gameId: game.id)
    }
}

extension GamesFlowCoordinator: GameDetailsSceneDelegate {
    
}
