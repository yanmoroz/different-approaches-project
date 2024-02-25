//
//  GamesListAssembly.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

enum GamesListAssembly {
    static func gamesList(delegate: GamesListSceneDelegate? = nil) -> GamesListViewController {
        let view = GamesListViewController()
        let apiService = MMOBombApiServiceImpl(
            httpService: URLSessionService(),
            responseParser: MMOBombResponseParserImpl()
        )
        let presenter = GamesListPresenter(
            view: view,
            apiService: apiService
        )
        presenter.delegate = delegate
        view.presenter = presenter
        return view
    }
}
