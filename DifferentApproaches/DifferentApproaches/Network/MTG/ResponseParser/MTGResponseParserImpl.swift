//
//  MTGResponseParserImpl.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 22.02.2024.
//

import Foundation

final class MTGResponseParserImpl {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
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

// MARK: - MTGResponseParser
extension MTGResponseParserImpl: MTGResponseParser {
    func parseGetAllCardsResponse(data: Data) throws -> [Card] {
        let parsedResponse = try decoder.decode(GetAllCardsResponse.self, from: data)
        return parsedResponse.cards.compactMap { try? Card(response: $0) }
    }
    
    func parseGetCardByIdResponse(data: Data) throws -> CardDetails {
        let parsedResponse = try decoder.decode(GetCardByIdResponse.self, from: data)
        return CardDetails(response: parsedResponse.card)
    }
}
