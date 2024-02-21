//
//  MMOBombApiService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

protocol MMOBombResponseParser {
    func parseGetAllGamesReponse(data: Data) throws -> [Game]?
    func parseGetGameByIdReponse(data: Data) throws -> GameDetailed?
}

class MMOBombApiService {
    
    private let httpService: HTTPService
    private let responseParser: MMOBombResponseParser
    
    init(httpService: HTTPService = URLSessionService(),
         responseParser: MMOBombResponseParser = MMOBombResponseParserImpl()) {
        
        self.httpService = httpService
        self.responseParser = responseParser
    }
    
    func getAllGames() async throws {
        let result = try await httpService.performRequest(MMOBombEndpoint.getAllGames)
        switch result {
        case .success(let data):
            break
        case .failure(let error):
            break
        }
    }
    
    func getRandomGame() {
        
    }
}
