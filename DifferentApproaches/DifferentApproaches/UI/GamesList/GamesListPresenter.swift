//
//  GamesListPresenter.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

final class GamesListPresenter {
    
    private weak var view: GamesListViewInterface?
    private let apiService: MMOBombApiService
    private let loadingTableViewProvider = LoadingTableViewProvider()
    private lazy var gamesListTableViewProvider: GamesListTableViewProvider = {
        let provider = GamesListTableViewProvider()
        provider.delegate = self
        return provider
    }()
    
    private var state = ViewState.loading {
        didSet {
            updateViewBaseOn(state: state)
        }
    }
    
    init(view: GamesListViewInterface,
         apiService: MMOBombApiService) {
        
        self.view = view
        self.apiService = apiService
    }
    
    private func setLoadingTableView() {
        view?.setTableViewProvider(loadingTableViewProvider)
        view?.reloadData()
    }
    
    private func setGamesListTableView() {
        view?.setTableViewProvider(gamesListTableViewProvider)
        view?.reloadData()
    }
    
    private func updateViewBaseOn(state: ViewState) {
        switch state {
        case .loading:
            setLoadingTableView()
            fetchAllGames()
        case .loadSucceed(let games):
            gamesListTableViewProvider.games = games
            setGamesListTableView()
        case .loadFailed(let error):
            break
        }
    }
    
    private func fetchAllGames() {
        Task { @MainActor in
            do {
                let games = try await apiService.getAllGames()
                state = .loadSucceed(games)
            } catch {
                state = .loadFailed(error)
            }
        }
    }
    
    private enum ViewState {
        case loading
        case loadSucceed([Game])
        case loadFailed(Error)
    }
}

extension GamesListPresenter: GamesListTableViewProviderDelegate {
    func didSelectGame(at index: Int) {
        print(index)
    }
}

extension GamesListPresenter: GamesListPresentation {
    
    func viewDidLoad() {
        state = .loading
    }
}
