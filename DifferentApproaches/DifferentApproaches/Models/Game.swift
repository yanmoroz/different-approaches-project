//
//  Game.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

struct Game {
    let id: Int
    let title: String
    let thumbnail: URL
    let shortDescription: String
    let gameUrl: URL
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let releaseDate: Date?
    let profileUrl: URL
}

extension Game {
    
    init(response: GetAllGamesResponse.Game) {
        self.id = response.id
        self.title = response.title
        self.thumbnail = response.thumbnail
        self.shortDescription = response.shortDescription
        self.gameUrl = response.gameUrl
        self.genre = response.genre
        self.platform = response.platform
        self.publisher = response.publisher
        self.developer = response.developer
        self.releaseDate = response.releaseDate
        self.profileUrl = response.profileUrl
    }
}
