//
//  CardsFlowCoordinator.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import UIKit

class CardsFlowCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
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
        let cardsListVC = CardsListAssembly.cardsList(delegate: self)
        navigationController.pushViewController(cardsListVC, animated: true)
    }

    func showCardDetailsScene(card: Card) {
        let cardDetailsVC = CardDetailsAssembly.cardDetails(card: card, delegate: self)
        navigationController.pushViewController(cardDetailsVC, animated: true)
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
