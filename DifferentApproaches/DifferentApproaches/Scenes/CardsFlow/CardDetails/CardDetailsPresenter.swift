//
//  CardDetailsPresenter.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import Foundation

final class CardDetailsPresenter {
    
    weak var delegate: CardDetailsSceneDelegate?
    private weak var view: CardDetailsViewInterface?
    private let apiService: MTGApiService
    private let card: Card
    
    private var state = ViewState.loading {
        didSet {
            updateViewBaseOn(state: state)
        }
    }
    
    private var fetchedCard: CardDetails? {
        didSet {
            view?.updateUI(with: fetchedCard)
        }
    }
    
    init(card: Card,
         view: CardDetailsViewInterface,
         apiService: MTGApiService) {
        
        self.card = card
        self.view = view
        self.apiService = apiService
    }
    
    fileprivate enum ViewState {
        case loading
        case loadSucceed(CardDetails)
        case loadFailed(Error)
    }
}

// MARK: - Private Methods
private extension CardDetailsPresenter {
    
    func fetchCardById(_ id: String) {
        Task { @MainActor in
            do {
                let card = try await apiService.getCardById(id)
                state = .loadSucceed(card)
            } catch {
                state = .loadFailed(error)
            }
        }
    }
    
    func updateViewBaseOn(state: ViewState) {
        switch state {
        case .loading:
            fetchCardById(card.id)
        case .loadSucceed(let card):
            fetchedCard = card
        case .loadFailed(let error):
            view?.showError(error)
        }
    }
}

// MARK: - CardDetailsPresentation
extension CardDetailsPresenter: CardDetailsPresentation {
    
    func viewDidLoad() {
        state = .loading
        view?.setupUI(with: card)
    }
}
