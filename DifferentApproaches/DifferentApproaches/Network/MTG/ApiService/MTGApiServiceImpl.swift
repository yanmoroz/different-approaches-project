//
//  MTGApiService.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

final class MTGApiServiceImpl {
    
    private let httpService: HTTPService
    private let responseParser: MTGResponseParser
    
    init(httpService: HTTPService,
         responseParser: MTGResponseParser) {
        
        self.httpService = httpService
        self.responseParser = responseParser
    }
}

// MARK: - MTGApiService
extension MTGApiServiceImpl: MTGApiService {
    
    func getAllCards() async throws -> [Card] {
        let data = try await httpService.performRequest(MTGEndpoint.getAllCards)
        return try responseParser.parseGetAllCardsResponse(data: data)
    }
    
    func getCardById(_ id: Int) async throws -> Card {
        let data = try await httpService.performRequest(MTGEndpoint.getCardDetails(id))
        return try responseParser.parseGetCardByIdResponse(data: data)
    }
}
