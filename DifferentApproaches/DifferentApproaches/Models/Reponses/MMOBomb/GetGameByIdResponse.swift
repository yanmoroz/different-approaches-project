//
//  GetGameByIdResponse.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 21.02.2024.
//

import Foundation

struct GetGameByIdResponse: Decodable {
    
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
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.thumbnail = try container.decode(URL.self, forKey: .thumbnail)
        self.status = try container.decode(String.self, forKey: .status)
        self.description = try container.decode(String.self, forKey: .description)
        self.genre = try container.decode(String.self, forKey: .genre)
        self.platform = try container.decode(String.self, forKey: .platform)
        self.publisher = try container.decode(String.self, forKey: .publisher)
        self.developer = try container.decode(String.self, forKey: .developer)
        self.screenshots = try container.decode([Screenshot].self, forKey: .screenshots)
        self.shortDescription = try container.decode(String.self, forKey: .shortDescription)
        self.gameUrl = try container.decode(URL.self, forKey: .gameUrl)
        self.profileUrl = try container.decode(URL.self, forKey: .profileUrl)
        self.minimumSystemRequirements = try container.decodeIfPresent(MinimumSystemRequirements.self, forKey: .minimumSystemRequirements)
        
        if let releaseDate = try? container.decodeIfPresent(Date.self, forKey: .releaseDate) {
            self.releaseDate = releaseDate
        } else {
            self.releaseDate = nil
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case thumbnail
        case status
        case description
        case genre
        case platform
        case publisher
        case developer
        case screenshots
        case shortDescription = "short_description"
        case gameUrl = "game_url"
        case releaseDate = "release_date"
        case profileUrl = "profile_url"
        case minimumSystemRequirements = "minimum_system_requirements"
    }
    
    struct MinimumSystemRequirements: Decodable {
        let os: String
        let processor: String
        let memory: String
        let graphics: String
        let storage: String
    }
    
    struct Screenshot: Decodable {
        let id: Int
        let image: URL
    }
}
