//
//  CardsListPresenter.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import Foundation

private enum ViewState {
    case loading
    case loadSucceed([Card])
    case loadFailed(Error)
}

final class CardsListPresenter {
    
    weak var delegate: CardsListSceneDelegate?
    private weak var view: CardsListViewInterface?
    private let apiService: MTGApiService
    
    private lazy var cardsListTableViewProvider: CardsListTableViewProvider = {
        let provider = CardsListTableViewProvider()
        provider.delegate = self
        return provider
    }()
    
    private var state = ViewState.loading {
        didSet {
            updateViewBaseOn(state: state)
        }
    }
    
    private var fetchedCards: [Card] = []

    init(view: CardsListViewInterface,
         apiService: MTGApiService) {
        
        self.view = view
        self.apiService = apiService
    }
}

// MARK: - Private Methods
private extension CardsListPresenter {
    
    func fetchAllCards() {
        Task { @MainActor in
            do {
                let cards = try await apiService.getAllCards()
                state = .loadSucceed(cards)
            } catch {
                state = .loadFailed(error)
            }
        }
    }
    
    func updateViewBaseOn(state: ViewState) {
        switch state {
        case .loading:
            fetchAllCards()
        case .loadSucceed(let cards):
            fetchedCards = cards
            cardsListTableViewProvider.cards = cards
            setCardsListTableView()
        case .loadFailed(let error):
            view?.showError(error)
        }
    }
    
    func setCardsListTableView() {
        view?.setTableViewProvider(cardsListTableViewProvider)
        view?.reloadData()
    }
}

// MARK: - CardsListTableViewProviderDelegate
extension CardsListPresenter: CardsListTableViewProviderDelegate {
    
    func didSelectCard(at index: Int) {
        let card = fetchedCards[index]
        delegate?.didSelectCard(card)
    }
}

// MARK: - CardsListPresentation
extension CardsListPresenter: CardsListPresentation {
    
    func viewDidLoad() {
        state = .loading
    }
}
