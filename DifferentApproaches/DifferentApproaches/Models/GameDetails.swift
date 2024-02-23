//
//  GameDetails.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 21.02.2024.
//

import Foundation

struct GameDetails: Identifiable {
    
    let id: Int
    let title: String
    let thumbnail: URL
    let status: String
    let shortDescription: String
    let description: String
    let gameUrl: URL
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let releaseDate: Date?
    let profileUrl: URL
    let minimumSystemRequirements: MinimumSystemRequirements?
    let screenshots: [Screenshot]
    
    struct MinimumSystemRequirements {
        
        let os: String
        let processor: String
        let memory: String
        let graphics: String
        let storage: String
    }
    
    struct Screenshot {
        
        let id: Int
        let image: URL
    }
}

extension GameDetails {
    init(response: GetGameByIdResponse) {
        id = response.id
        title = response.title
        thumbnail = response.thumbnail
        status = response.status
        shortDescription = response.shortDescription
        description = response.description
        gameUrl = response.gameUrl
        genre = response.genre
        platform = response.platform
        publisher = response.publisher
        developer = response.developer
        releaseDate = response.releaseDate
        profileUrl = response.profileUrl
        screenshots = response.screenshots.map(Screenshot.init)
        
        if let minimumSystemRequirements = response.minimumSystemRequirements {
            self.minimumSystemRequirements = .init(minimumSystemRequirements: minimumSystemRequirements)
        } else {
            minimumSystemRequirements = nil
        }
    }
}

extension GameDetails.MinimumSystemRequirements {
    init(minimumSystemRequirements: GetGameByIdResponse.MinimumSystemRequirements) {
        os = minimumSystemRequirements.os
        processor = minimumSystemRequirements.processor
        memory = minimumSystemRequirements.memory
        graphics = minimumSystemRequirements.graphics
        storage = minimumSystemRequirements.storage
    }
}

extension GameDetails.Screenshot {
    init(screenshot: GetGameByIdResponse.Screenshot) {
        id = screenshot.id
        image = screenshot.image
    }
}
