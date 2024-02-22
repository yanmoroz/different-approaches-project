//
//  GamesListAssembly.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

struct GamesListAssembly {
    static func gamesList() -> GamesListViewController {
        let view = GamesListViewController()
        let presenter = GamesListPresenter(view: view, apiService: MMOBombApiServiceImpl())
        view.presenter = presenter
        return view
    }
}
