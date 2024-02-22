//
//  MMOBombApiService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 20.02.2024.
//

import Foundation

protocol MMOBombResponseParser {
    func parseGetAllGamesResponse(data: Data) throws -> [Game]
    func parseGetGameByIdResponse(data: Data) throws -> GameDetailed
}

protocol MMOBombApiService {
    func getAllGames() async throws -> [Game]
    func getGameById(_ id: Int) async throws -> GameDetailed
}

class MMOBombApiServiceImpl: MMOBombApiService {
    
    private let httpService: HTTPService
    private let responseParser: MMOBombResponseParser
    
    init(httpService: HTTPService = URLSessionService(),
         responseParser: MMOBombResponseParser = MMOBombResponseParserImpl()) {
        
        self.httpService = httpService
        self.responseParser = responseParser
    }
    
    func getAllGames() async throws -> [Game] {
        let result = try await httpService.performRequest(MMOBombEndpoint.getAllGames)
        switch result {
        case .success(let data):
            return try responseParser.parseGetAllGamesResponse(data: data)
        case .failure(let error):
            throw error
        }
    }
    
    func getGameById(_ id: Int) async throws -> GameDetailed {
        let result = try await httpService.performRequest(MMOBombEndpoint.getGameDetails(id))
        switch result {
        case .success(let data):
            return try responseParser.parseGetGameByIdResponse(data: data)
        case .failure(let error):
            throw error
        }
    }
}
