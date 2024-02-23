//
//  MainViewController.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import UIKit

final class MainViewController: UITabBarController {
    
    private lazy var coordinators: [Coordinator] = [
        self.gamesTabCoordinator(),
        self.cardsTabprepareGamesTab()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = coordinators.map({ $0.navigationController })
    }
}

private extension MainViewController {
    
    func gamesTabCoordinator() -> GamesFlowCoordinator {
        let gamesTabCoordinator = GamesFlowCoordinator(navigationController: UINavigationController())
        let gamesTab = UITabBarItem(title: "Games", image: UIImage(systemName: "gamecontroller"), selectedImage: UIImage(systemName: "gamecontroller.fill"))
        gamesTabCoordinator.navigationController.tabBarItem = gamesTab
        gamesTabCoordinator.start()
        return gamesTabCoordinator
    }
    
    func cardsTabprepareGamesTab() -> GamesFlowCoordinator {
        let cardsTabCoordinator = GamesFlowCoordinator(navigationController: UINavigationController())
        let cardsTab = UITabBarItem(title: "Cards", image: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"))
        cardsTabCoordinator.navigationController.tabBarItem = cardsTab
        cardsTabCoordinator.start()
        return cardsTabCoordinator
    }
}
