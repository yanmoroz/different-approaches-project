//
//  CardDetailsViewController.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import UIKit

final class CardDetailsViewController: UIViewController {
    private lazy var customView = view as? CardDetailsView
    var presenter: CardDetailsPresentation?
    
    override func loadView() {
        view = CardDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: - CardDetailsViewInterface
extension CardDetailsViewController: CardDetailsViewInterface {
    func setupUI(with card: Card) {
        title = card.name
    }
    
    func updateUI(with card: CardDetails?) {
        customView?.update(with: card)
    }
}
