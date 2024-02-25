//
//  CardDetailsAssembly.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import Foundation

enum CardDetailsAssembly {
    static func cardDetails(card: Card, delegate: CardDetailsSceneDelegate? = nil) -> CardDetailsViewController {
        let view = CardDetailsViewController()
        let apiService = MTGApiServiceImpl(
            httpService: URLSessionService(),
            responseParser: MTGResponseParserImpl()
        )
        let presenter = CardDetailsPresenter(
            card: card,
            view: view,
            apiService: apiService
        )
        presenter.delegate = delegate
        view.presenter = presenter
        return view
    }
}
