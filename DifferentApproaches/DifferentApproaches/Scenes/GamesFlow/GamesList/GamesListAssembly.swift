//
//  GamesListAssembly.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

struct GamesListAssembly {
    
    static func gamesList(delegate: GamesListSceneDelegate? = nil) -> GamesListViewController {
        let view = GamesListViewController()
        let presenter = GamesListPresenter(view: view, apiService: MMOBombApiServiceImpl())
        presenter.delegate = delegate
        view.presenter = presenter
        return view
    }
}
