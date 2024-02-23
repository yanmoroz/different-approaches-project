//
//  GameTableViewCell.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import UIKit

final class GameTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
        
        genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
        genreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    func setTitle(_ title: String, genre: String) {
        titleLabel.text = title
        genreLabel.text = genre
    }
}
