//
//  MTGApiService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

protocol MTGResponseParser {
    func parseGetAllCardsResponse(data: Data) throws -> [Card]
    func parseGetCardByIdResponse(data: Data) throws -> Card
}

protocol MTGApiService {
    func getAllCards() async throws -> [Card]
    func getCardById(_ id: Int) async throws -> Card
}

class MTGApiServiceImpl: MTGApiService {
    
    private let httpService: HTTPService
    private let responseParser: MTGResponseParser
    
    init(httpService: HTTPService = URLSessionService(),
         responseParser: MTGResponseParser = MTGResponseParserImpl()) {
        
        self.httpService = httpService
        self.responseParser = responseParser
    }
    
    func getAllCards() async throws -> [Card] {
        let result = try await httpService.performRequest(MTGEndpoint.getAllCards)
        switch result {
        case .success(let data):
            return try responseParser.parseGetAllCardsResponse(data: data)
        case .failure(let error):
            throw error
        }
    }
    
    func getCardById(_ id: Int) async throws -> Card {
        let result = try await httpService.performRequest(MTGEndpoint.getCardDetails(id))
        switch result {
        case .success(let data):
            return try responseParser.parseGetCardByIdResponse(data: data)
        case .failure(let error):
            throw error
        }
    }
}
