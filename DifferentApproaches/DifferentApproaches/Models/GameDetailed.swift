//
//  GameDetailed.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 21.02.2024.
//

import Foundation

struct GameDetailed {
    
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

extension GameDetailed {
    init(response: GetGameByIdResponse) {
        self.id = response.id
        self.title = response.title
        self.thumbnail = response.thumbnail
        self.status = response.status
        self.shortDescription = response.shortDescription
        self.description = response.description
        self.gameUrl = response.gameUrl
        self.genre = response.genre
        self.platform = response.platform
        self.publisher = response.publisher
        self.developer = response.developer
        self.releaseDate = response.releaseDate
        self.profileUrl = response.profileUrl
        self.screenshots = response.screenshots.map(Screenshot.init)
        
        if let minimumSystemRequirements = response.minimumSystemRequirements {
            self.minimumSystemRequirements = .init(minimumSystemRequirements: minimumSystemRequirements)
        } else {
            self.minimumSystemRequirements = nil
        }
    }
}

extension GameDetailed.MinimumSystemRequirements {
    init(minimumSystemRequirements: GetGameByIdResponse.MinimumSystemRequirements) {
        self.os = minimumSystemRequirements.os
        self.processor = minimumSystemRequirements.processor
        self.memory = minimumSystemRequirements.memory
        self.graphics = minimumSystemRequirements.graphics
        self.storage = minimumSystemRequirements.storage
    }
}

extension GameDetailed.Screenshot {
    init(screenshot: GetGameByIdResponse.Screenshot) {
        self.id = screenshot.id
        self.image = screenshot.image
    }
}
