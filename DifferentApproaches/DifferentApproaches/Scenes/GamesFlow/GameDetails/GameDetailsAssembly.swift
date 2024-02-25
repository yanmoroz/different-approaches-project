//
//  GameDetailsAssembly.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import Foundation

enum GameDetailsAssembly {

    static func gameDetails(game: Game, delegate: GameDetailsSceneDelegate? = nil) -> GameDetailsViewController {
        let view = GameDetailsViewController()
        let apiService = MMOBombApiServiceImpl(
            httpService: URLSessionService(),
            responseParser: MMOBombResponseParserImpl()
        )
        let presenter = GameDetailsPresenter(
            game: game,
            view: view,
            apiService: apiService
        )
        presenter.delegate = delegate
        view.presenter = presenter
        return view
    }
}
