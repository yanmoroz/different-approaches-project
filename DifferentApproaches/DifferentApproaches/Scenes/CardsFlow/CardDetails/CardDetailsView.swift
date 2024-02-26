//
//  CardDetailsView.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import UIKit

final class CardDetailsView: UIView {
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .secondarySystemBackground
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
extension CardDetailsView {
    func update(with model: CardDetails) {
        textLabel.text = model.text
        
        Task { @MainActor in
            imageView.image = try await ImageDownloader.shared.downloadImage(for: model.imageUrl)
        }
    }
}

// MARK: - Private Methods
private extension CardDetailsView {
    func setupUI() {
        backgroundColor = .systemBackground
        addSubview(imageView)
        addSubview(textLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0).isActive = true
        
        textLabel.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.0).isActive = true
        textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
