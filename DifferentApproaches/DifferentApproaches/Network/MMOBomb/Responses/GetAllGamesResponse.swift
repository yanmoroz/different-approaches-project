//
//  GetAllGamesResponse.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

struct GetAllGamesResponse: Decodable {
    let games: [Game]
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var games: [Game] = []

        while !container.isAtEnd {
            let game = try container.decode(Game.self)
            games.append(game)
        }
        
        self.games = games
    }
    
    struct Game: Decodable {
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
        
        enum CodingKeys: CodingKey {
            case id
            case title
            case thumbnail
            case shortDescription
            case gameUrl
            case genre
            case platform
            case publisher
            case developer
            case releaseDate
            case profileUrl
        }
        
        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decode(Int.self, forKey: .id)
            self.title = try container.decode(String.self, forKey: .title)
            self.thumbnail = try container.decode(URL.self, forKey: .thumbnail)
            self.genre = try container.decode(String.self, forKey: .genre)
            self.platform = try container.decode(String.self, forKey: .platform)
            self.publisher = try container.decode(String.self, forKey: .publisher)
            self.developer = try container.decode(String.self, forKey: .developer)
            self.shortDescription = try container.decode(String.self, forKey: .shortDescription)
            self.gameUrl = try container.decode(URL.self, forKey: .gameUrl)
            self.profileUrl = try container.decode(URL.self, forKey: .profileUrl)
            
            let releaseDate = try? container.decodeIfPresent(Date.self, forKey: .releaseDate)
            if let releaseDate {
                self.releaseDate = releaseDate
            } else {
                self.releaseDate = nil
            }
        }
    }
}
