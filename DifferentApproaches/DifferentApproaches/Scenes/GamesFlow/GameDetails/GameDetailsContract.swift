//
//  GameDetailsContract.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import Foundation

protocol GameDetailsViewInterface: ViewInterface {
    func setupUI(with game: Game)
    func updateUI(with game: GameDetails?)
}

protocol GameDetailsPresentation {
    func viewDidLoad()
}

protocol GameDetailsSceneDelegate: AnyObject {
}
