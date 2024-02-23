//
//  Game.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

struct Game: Identifiable {
    
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

// MARK: - Casting Inits
extension Game {
    
    init(response: GetAllGamesResponse.Game) {
        id = response.id
        title = response.title
        thumbnail = response.thumbnail
        shortDescription = response.shortDescription
        gameUrl = response.gameUrl
        genre = response.genre
        platform = response.platform
        publisher = response.publisher
        developer = response.developer
        releaseDate = response.releaseDate
        profileUrl = response.profileUrl
    }
}
