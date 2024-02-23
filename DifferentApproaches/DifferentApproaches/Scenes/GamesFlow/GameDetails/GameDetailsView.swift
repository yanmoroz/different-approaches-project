//
//  GameDetailsView.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import UIKit

final class GameDetailsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension GameDetailsView {
    
    func setupUI() {
        setupConstraints()
    }
    
    func setupConstraints() {
        backgroundColor = .systemBackground
    }
}

extension GameDetailsView {
    
}
