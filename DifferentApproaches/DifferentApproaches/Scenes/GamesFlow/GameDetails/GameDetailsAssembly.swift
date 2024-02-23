//
//  GameDetailsAssembly.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import Foundation

struct GameDetailsAssembly {
    
    static func gameDetails(gameId: Game.ID, delegate: GameDetailsSceneDelegate? = nil) -> GameDetailsViewController {
        let view = GameDetailsViewController()
        let presenter = GameDetailsPresenter(gameId: gameId, view: view, apiService: MMOBombApiServiceImpl())
        presenter.delegate = delegate
        view.presenter = presenter
        return view
    }
}