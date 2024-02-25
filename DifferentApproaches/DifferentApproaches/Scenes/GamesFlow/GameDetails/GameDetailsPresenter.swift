//
//  GamesListPresenter.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import Foundation

private enum ViewState {
    case loading
    case loadSucceed(GameDetails)
    case loadFailed(Error)
}

final class GameDetailsPresenter {
    weak var delegate: GameDetailsSceneDelegate?
    private weak var view: GameDetailsViewInterface?
    private let apiService: MMOBombApiService
    private let game: Game
    
    private var state = ViewState.loading {
        didSet {
            updateViewBaseOn(state: state)
        }
    }
    
    private var fetchedGame: GameDetails? {
        didSet {
            view?.updateUI(with: fetchedGame)
        }
    }
    
    init(game: Game,
         view: GameDetailsViewInterface,
         apiService: MMOBombApiService) {
        self.game = game
        self.view = view
        self.apiService = apiService
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
            fetchGameById(game.id)
        case .loadSucceed(let game):
            fetchedGame = game
        case .loadFailed(let error):
            view?.showError(error)
        }
    }
}

// MARK: - GameDetailsPresentation
extension GameDetailsPresenter: GameDetailsPresentation {
    func viewDidLoad() {
        state = .loading
        view?.setupUI(with: game)
    }
}
