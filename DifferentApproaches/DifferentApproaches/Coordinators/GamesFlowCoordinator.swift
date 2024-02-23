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
    
    func start() {
        showGamesListScene()
    }
    
    private func showGamesListScene() {
        navigationController.pushViewController(GamesListAssembly.gamesList(), animated: true)
    }
}
