//
//  GamesListPresenter.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

final class GamesListPresenter {
    
    weak var delegate: GamesListSceneDelegate?
    private weak var view: GamesListViewInterface?
    private let apiService: MMOBombApiService
    private let loadingTableViewProvider = LoadingTableViewProvider() // TODO: ???
    
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
    
    private var fetchedGames = [Game]() {
        willSet {
            displayedGames = newValue
        }
    }
    
    private var displayedGames = [Game]() {
        willSet {
            setGamesListTableView(games: newValue)
        }
    }
    
    init(view: GamesListViewInterface,
         apiService: MMOBombApiService) {
        
        self.view = view
        self.apiService = apiService
    }
    
    fileprivate enum ViewState {
        case loading
        case loadSucceed([Game])
        case loadFailed(Error)
    }
}

// MARK: - Private Methods
private extension GamesListPresenter {
    
    func fetchAllGames() {
        Task { @MainActor in
            do {
                let games = try await apiService.getAllGames()
                state = .loadSucceed(games)
            } catch {
                state = .loadFailed(error)
            }
        }
    }
    
    func updateViewBaseOn(state: ViewState) {
        switch state {
        case .loading:
            setLoadingTableView()
            fetchAllGames()
        case .loadSucceed(let games):
            fetchedGames = games
        case .loadFailed(let error):
            view?.showError(error)
        }
    }
    
    func setLoadingTableView() {
        view?.setTableViewProvider(loadingTableViewProvider)
        view?.reloadData()
    }
    
    func setGamesListTableView(games: [Game]) {
        view?.setTableViewProvider(gamesListTableViewProvider)
        updateGamesInView(games: games)
    }
    
    func updateGamesInView(games: [Game]) {
        gamesListTableViewProvider.games = games
        view?.reloadData()
    }
}

// MARK: - GamesListTableViewProviderDelegate
extension GamesListPresenter: GamesListTableViewProviderDelegate {
    
    func didSelectGame(at index: Int) {
        let game = fetchedGames[index]
        delegate?.didSelectGame(game)
    }
}

// MARK: - GamesListPresentation
extension GamesListPresenter: GamesListPresentation {
    
    func searchQueryDidChange(_ query: String) {
        guard query.count > 0 else {
            displayedGames = fetchedGames
            return
        }
        
        displayedGames = fetchedGames.filter({ $0.title.contains(query)})
    }
    
    func viewDidLoad() {
        state = .loading
    }
}
