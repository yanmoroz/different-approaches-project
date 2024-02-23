//
//  MMOBombApiService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

final class MMOBombApiServiceImpl {
    
    private let httpService: HTTPService
    private let responseParser: MMOBombResponseParser
    
    init(httpService: HTTPService = URLSessionService(),
         responseParser: MMOBombResponseParser = MMOBombResponseParserImpl()) {
        
        self.httpService = httpService
        self.responseParser = responseParser
    }
}

// MARK: - MMOBombApiService
extension MMOBombApiServiceImpl: MMOBombApiService {
    
    func getAllGames() async throws -> [Game] {
        let data = try await httpService.performRequest(MMOBombEndpoint.getAllGames)
        return try responseParser.parseGetAllGamesResponse(data: data)
    }
    
    func getGameById(_ id: Int) async throws -> GameDetails {
        let data = try await httpService.performRequest(MMOBombEndpoint.getGameDetails(id))
        return try responseParser.parseGetGameByIdResponse(data: data)
    }
}
