//
//  MMOBombResponseParserImpl.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 21.02.2024.
//

import Foundation

final class MMOBombResponseParserImpl {
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            return JSONDecoder.DateDecodingStrategy.formatted(dateFormatter)
        }()
        return decoder
    }()
}

// MARK: - MMOBombResponseParser
extension MMOBombResponseParserImpl: MMOBombResponseParser {
    
    func parseGetAllGamesResponse(data: Data) throws -> [Game] {
        let parsedResponse = try decoder.decode(GetAllGamesResponse.self, from: data)
        return parsedResponse.games.map(Game.init)
    }
    
    func parseGetGameByIdResponse(data: Data) throws -> GameDetails {
        let parsedResponse = try decoder.decode(GetGameByIdResponse.self, from: data)
        return GameDetails(response: parsedResponse)
    }
}
