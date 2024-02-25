//
//  CardsListAssembly.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import Foundation

enum CardsListAssembly {
    
    static func cardsList(delegate: CardsListSceneDelegate? = nil) -> CardsListViewController {
        let view = CardsListViewController()
        let apiService = MTGApiServiceImpl(
            httpService: URLSessionService(),
            responseParser: MTGResponseParserImpl()
        )
        let presenter = CardsListPresenter(
            view: view,
            apiService: apiService
        )
        presenter.delegate = delegate
        view.presenter = presenter
        return view
    }
}
