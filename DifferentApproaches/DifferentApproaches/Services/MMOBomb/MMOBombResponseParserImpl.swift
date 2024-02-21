//
//  MMOBombResponseParserImpl.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 21.02.2024.
//

import Foundation

class MMOBombResponseParserImpl: MMOBombResponseParser {
    
    private let decoder: JSONDecoder = {
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
                                          
        return decoder
    }()
    
    func parseGetAllGamesReponse(data: Data) throws -> [Game]? {
        let parsedResponse = try decoder.decode(GetAllGamesResponse.self, from: data)
        return parsedResponse.games.map(Game.init)
    }
    
    func parseGetGameByIdReponse(data: Data) throws -> GameDetailed? {
        let parsedResponse = try decoder.decode(GetGameByIdResponse.self, from: data)
        return GameDetailed(response: parsedResponse)
    }
}
