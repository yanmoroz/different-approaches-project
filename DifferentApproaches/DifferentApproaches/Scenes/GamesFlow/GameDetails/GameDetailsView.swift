//
//  GameDetailsView.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 23.02.2024.
//

import UIKit

final class GameDetailsView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension GameDetailsView {
    func update(with model: GameDetails) {
//        guard let model else { return }

        titleLabel.text = model.title

        Task { @MainActor in
            let data = try! await ImageDownloader.downloadImageData(from: model.thumbnail)
            imageView.image = UIImage(data: data)
        }
    }
}

// MARK: - Private Methods
private extension GameDetailsView {
    func setupUI() {
        backgroundColor = .systemBackground
        addSubview(imageView)
        addSubview(titleLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
//        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
    }
}
