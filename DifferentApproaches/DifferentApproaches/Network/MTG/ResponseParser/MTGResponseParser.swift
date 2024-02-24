//
//  MTGResponseParser.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 24.02.2024.
//

import Foundation

protocol MTGResponseParser {
    func parseGetAllCardsResponse(data: Data) throws -> [Card]
    func parseGetCardByIdResponse(data: Data) throws -> CardDetails
}
