//
//  CardDetailsContract.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import Foundation

protocol CardDetailsViewInterface: ViewInterface {
    func setupUI(with card: Card)
    func updateUI(with card: CardDetails?)
}

protocol CardDetailsPresentation {
    func viewDidLoad()
}

protocol CardDetailsSceneDelegate: AnyObject {
}
