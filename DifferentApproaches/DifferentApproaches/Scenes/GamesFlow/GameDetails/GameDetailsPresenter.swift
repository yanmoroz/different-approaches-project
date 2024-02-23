//
//  GamesListPresenter.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import Foundation

final class GameDetailsPresenter {
    
    weak var delegate: GameDetailsSceneDelegate?
    private weak var view: GameDetailsViewInterface?
    private let apiService: MMOBombApiService
    private let gameId: Game.ID
    
    private var state = ViewState.loading {
        didSet {
            updateViewBaseOn(state: state)
        }
    }
    
    init(gameId: Game.ID,
         view: GameDetailsViewInterface,
         apiService: MMOBombApiService) {
        
        self.gameId = gameId
        self.view = view
        self.apiService = apiService
    }
    
    fileprivate enum ViewState {
        case loading
        case loadSucceed(GameDetails)
        case loadFailed(Error)
    }
}

// MARK: - Private Methods
private extension GameDetailsPresenter {
    
    func fetchGameById(_ id: Int) {
        Task { @MainActor in
            do {
                let game = try await apiService.getGameById(id)
                state = .loadSucceed(game)
            } catch {
                state = .loadFailed(error)
            }
        }
    }
    
    func updateViewBaseOn(state: ViewState) {
        switch state {
        case .loading:
            fetchGameById(gameId)
        case .loadSucceed(let game):
            break // TODO: ACTION?
        case .loadFailed(let error):
            view?.showError(error)
        }
    }
}

// MARK: - GameDetailsPresentation
extension GameDetailsPresenter: GameDetailsPresentation {
    
    func viewDidLoad() {
        state = .loading
    }
}
