//
//  MainViewController.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import UIKit

class MainViewController: UITabBarController {

    private lazy var coordinators: [Coordinator] = [
        self.gamesTabCoordinator(),
        self.cardsTabprepareGamesTab()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = coordinators.map { $0.navigationController }
    }
}

private enum Tab {
    
    case games
    case cards
    
    var title: String {
        switch self {
        case .games:
            return "Games"
        case .cards:
            return "Cards"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .games:
            return UIImage(systemName: "gamecontroller")
        case .cards:
            return UIImage(systemName: "menucard")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .games:
            return UIImage(systemName: "gamecontroller.fill")
        case .cards:
            return UIImage(systemName: "menucard.fill")
        }
    }
    
    var tabBarItem: UITabBarItem {
        return UITabBarItem(title: title, image: image, selectedImage: selectedImage)
    }
}

// MARK: - Private Methods
private extension MainViewController {
    
    func gamesTabCoordinator() -> GamesFlowCoordinator {
        let coordinator = GamesFlowCoordinator(navigationController: UINavigationController())
        let tabItem = Tab.games.tabBarItem
        coordinator.navigationController.navigationBar.prefersLargeTitles = true
        coordinator.navigationController.tabBarItem = tabItem
        coordinator.start()
        return coordinator
    }
    
    func cardsTabprepareGamesTab() -> CardsFlowCoordinator {
        let coordinator = CardsFlowCoordinator(navigationController: UINavigationController())
        let tabItem = Tab.cards.tabBarItem
        coordinator.navigationController.navigationBar.prefersLargeTitles = true
        coordinator.navigationController.tabBarItem = tabItem
        coordinator.start()
        return coordinator
    }
}
