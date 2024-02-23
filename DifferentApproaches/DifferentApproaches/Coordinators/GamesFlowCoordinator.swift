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
        navigationController.pushViewController(GamesListAssembly.gamesList(), animated: true)
    }
}

extension GamesFlowCoordinator {
    
    func start() {
        showGamesListScene()
    }
}
