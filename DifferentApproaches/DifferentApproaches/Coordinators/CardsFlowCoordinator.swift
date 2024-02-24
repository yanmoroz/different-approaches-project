//
//  CardsFlowCoordinator.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import UIKit

class CardsFlowCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var delegate: CardsFlowCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - CardsFlowCoordinatorDelegate
protocol CardsFlowCoordinatorDelegate: AnyObject {
    
}

// MARK: - Private Methods
private extension CardsFlowCoordinator {
    
    func showCardsListScene() {
        navigationController.pushViewController(CardsListAssembly.cardsList(delegate: self), animated: true)
    }
    
    func showCardDetailsScene(card: Card) {
        navigationController.pushViewController(CardDetailsAssembly.cardDetails(card: card, delegate: self), animated: true)
    }
}

// MARK: - Coordinator
extension CardsFlowCoordinator {
    
    func start() {
        showCardsListScene()
    }
}

// MARK: - CardsListSceneDelegate
extension CardsFlowCoordinator: CardsListSceneDelegate {
    
    func didSelectCard(_ card: Card) {
        showCardDetailsScene(card: card)
    }
}

// MARK: - CardDetailsSceneDelegate
extension CardsFlowCoordinator: CardDetailsSceneDelegate {
    
}
